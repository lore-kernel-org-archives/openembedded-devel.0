Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2DBC3DA41
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7389.1687180983938041742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=5NfeMz8i;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so3435634f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180982; x=1689772982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y71r6Tu8NBru+3AZIB9gf8GcBOl4ojAx68BUKEmS2+o=;
        b=5NfeMz8ivBXvBn+e7VUb2tfChe9oRUb0yvswPyUoUUiKk+W91dxNI8hbAxkc8MTkqb
         JuAqsUzTq5PLO3a10a4iDp5lySQpbJbI0UIcEh0/e3XvBh5hT2f/URQX2OuFPfxEtqwn
         u5xz+sSMwPBsGksx4LXrUWMErHv5gHujy6MwqLL9lsfPbHiBFiiwAsQrnbkJhVyiD2aC
         YRs9r022CZYsTDCfF7niAHUyId+ZklACDleUsq0ENWLBm9t6vQ+82xek2o1MhYlh6zWr
         FqO7ujCsns5K7t88hY3yRHCR4wpxr4AJ4+3p9RaCYjAaQqRvhABafbL5TfMRoUgB0COU
         W7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180982; x=1689772982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y71r6Tu8NBru+3AZIB9gf8GcBOl4ojAx68BUKEmS2+o=;
        b=YO9efcfFTyhxrdedV5CWzzmWOlDL4WAhdedoxh9z/CkEPVjai/qN8x/1Q75eyUedTH
         qNLYZnMfIGO+0NzootSk/Qr6XXRDB1Vo8mV2FSuBNca2BAqBr7HpYVhcfzHfbkpf8CBv
         QdVYBTwq1B/Y7ntls5tF8nlzQAhxFaBqjRyOCdq3kCuanEVuC5wx/466KCTvLjw2ctnM
         NBYfhXEfkMVxV5LvciEjwL4e4SAZJTqO4pRJw+ENKqQHt9aqaTx+kFbWeBg5L3zG0j7u
         mN88E3LPdnozKjbM/qa6iy3dHwmXXtoD+IzKJ6G0YJhqQoJ7S/V2Ucg3jZA/7m7Kla+N
         BqMQ==
X-Gm-Message-State: AC+VfDyxatQYyWF5Kp6rDEuOcfZ4jUki1s0z51E4Iy+iwfuRRyRYjLgg
	8EHglte/D+jbVcWyvvZ0OFA+Xg==
X-Google-Smtp-Source: ACHHUZ5h59QsOwavloPU9F13AEn4Zcissr+Y2klhx/6rJu1rAKIXe0pjghZoqzElfTqLuTBDNtQQ7w==
X-Received: by 2002:adf:fc4e:0:b0:30f:cf52:9194 with SMTP id e14-20020adffc4e000000b0030fcf529194mr7822216wrs.58.1687180982481;
        Mon, 19 Jun 2023 06:23:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 40/54] python3-click-spinner: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:00 +0200
Message-Id: <20230619132214.213417-41-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103424

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-click-spinner_0.1.10.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
index 418f8a32a..bd1136fd7 100644
--- a/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-click-spinner_0.1.10.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "ab68ed404401421819c81cc6c0677a87"
 SRC_URI[sha256sum] = "87eacf9d7298973a25d7615ef57d4782aebf913a532bba4b28a37e366e975daf"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-json"
-- 
2.39.2


