Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB2FC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9131.1685521573824908600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=UBrfWOq/;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f6042d605dso40351185e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521572; x=1688113572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MQ/+2VpkeDVFM+hJwjrisshGzKecmEwdrYZFFywJbU=;
        b=UBrfWOq/rh0XbENxC+otv14vkHgGnrNltJ7s5Bps2PjjTO6FHeWD+9itQ9PtHUOoGx
         xGqYakGjNTKrJL3Fw/RfZiMrPjooD9qy4XQrs9UX3F3bYiEBJwNq56bRr0F6Gw9bP/gg
         AW9CmBOBLDfa/s03rRd4bDLbRu0laXpe3Di9FiFg1V5LFmVhDgWsuRIsCymRw+ch6ZFY
         gc85XmQnPZ9DcVrgnxjxF1NWc8lh7/jCKEKPlQ9OM5yzdSaJEKPLPgCQGtIugV+DUVm3
         ttqGLdJDXSkBpUMn9Go6x4jpFjKwshYkHQTvMTvJ8ywpQnvnttDw/LuPKekPNDPc4n4O
         7fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521572; x=1688113572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MQ/+2VpkeDVFM+hJwjrisshGzKecmEwdrYZFFywJbU=;
        b=JP9FbIGt/z+ydt392mhRw8W/xE9h5Ye9wFO6g07SnRDRNDtQc1flZpBweHZXMri6Kx
         MCa/0UFGaP4NW/Lkf11LgACb32vexo2fGF8QfuP8/NdmrOLg3JNXGXP9TYRsSXzOFyBe
         FiIkbHvX7OFeqn/a6hCEgBTajRJkYCKWca03PD3ifdStfZ3qNW8pAAtrwwsYaENOpSKT
         wVl6uorSAwliHtv7KwQyyP4LoVJ7CXU+VledHhAUverEKzqjqCYM53Nd6MP6a94TYoug
         Iy5sl1BxnAKI1wPMfvsRuR+IMSoyhUQX6eMyjKXs12I+Xy8RZJqIGU68iJEPOdVo2pX0
         T+bA==
X-Gm-Message-State: AC+VfDzti8MvTFVu57w6nXo69o5SUZl1atGKHNDxnssA8d+lDPw+Z+M9
	D5Gmp+Tz4PFEsfmOJ9WFa8cSgg==
X-Google-Smtp-Source: ACHHUZ7puFSqtPnpA7TgmVp4WGj14OGj933MAd8QGz7mkqACnMhjvepKqAu5BoHyORiFAmHdz/KsUQ==
X-Received: by 2002:adf:f091:0:b0:30a:e954:3d99 with SMTP id n17-20020adff091000000b0030ae9543d99mr3344570wro.58.1685521572294;
        Wed, 31 May 2023 01:26:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 059/149] python3-raven: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:07 +0200
Message-Id: <20230531082437.10646-60-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102986

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-raven_6.10.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
index b0d19c31a..79a38983d 100644
--- a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
@@ -11,3 +11,8 @@ SRC_URI[sha256sum] = "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c
 
 PYPI_PACKAGE = "raven"
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-json \
+    python3-logging \
+"
-- 
2.39.2


