Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C81BC7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9051.1685521511132656631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=aXuB81Xd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30b023b0068so544951f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521509; x=1688113509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SxgAyXkCrIOT0tjlYhP7PendxuWWJyQd2fchU0+i0w=;
        b=aXuB81Xd8ELaWgUJDTD9s8Rzk5C9bnBbFTOKqoEPCGePDCeRcUBd7aBbIhgGDmOJDX
         xVGu9FUpPY8seAbCsD2XJfHjTmKkkJY6nPcI1eoehKVJD3/MP1iOdN8/YtIOUsGy8Fgg
         4/Qq01gDaXCYmtkesBHwYI2nuVGhWviImY8jJtMG6QPjFGMF2cTt0Kpuee8wGeJ78yjt
         Ql3BRCX0QoI/EniciAS8F+nNejOvjPH1e9+PKepj6ntFuu+ZYjBG1wn0aZyMHZAUYKPz
         hLD1O2julIEo2NKiBBK/QcqN54CvYfe61J008Rv7u08avjFtKp9g3lSkpIPpjXLflwbR
         xoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521509; x=1688113509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SxgAyXkCrIOT0tjlYhP7PendxuWWJyQd2fchU0+i0w=;
        b=Sx1ThE4V6JU9btzt7neG6GB9btb+RQAMWPb5ZTy/cVJQpHwJpebzHUcpvN64iJ0DaY
         c/LCWvqnF3TW9wFZhnPuKlE+OLcy76Fisq4yz7IhAaqyE0zIO5BeWRwQr3G1RPcEOmXx
         j7WFyitTduvnJTRPxIj9hy/pqL4tPMN6UeUb4FBnTuCcbFf05CMpUkHjIZt1lQ+jOTrr
         SGJwvZRCY1VvIqFFPndFFwE4NVe+Z13c/nb8kguoUTph7NmNNsDuVQ9QIL+NXRRdcVNB
         FqvAJQkurJRAN8v/EJqSltchWY0Wu8P/D5yqODUozElLj48kPYSn/B9XGW+IE2GZuU92
         Kdjw==
X-Gm-Message-State: AC+VfDxZ016EJZufiSrkNJ+3QHBOBJuyPXsRTe1aUjIvd75WKyWnst8R
	HHiZ2Dlx+2PiawL9F1nf2L4rKtIJ8WKhgtlrhF8=
X-Google-Smtp-Source: ACHHUZ4yMlWWD9mj8f1gxW52+vzihijpyr3laZEECISSsvTR47TLGlDTfxoDyAtn3D25LTzcEip04A==
X-Received: by 2002:a5d:564c:0:b0:2ff:801b:dec6 with SMTP id j12-20020a5d564c000000b002ff801bdec6mr3340722wrw.20.1685521509642;
        Wed, 31 May 2023 01:25:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 002/149] python3-send2trash: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:10 +0200
Message-Id: <20230531082437.10646-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102929

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-extended/send2trash/python3-send2trash_1.8.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
index 963351a2e..a20b0194f 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
@@ -7,3 +7,5 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "d2c24762fd3759860a0aff155e45871447ea58d2be6bdd39b5c8f966a0c99c2d"
 
 PYPI_PACKAGE = "Send2Trash"
+
+RDEPENDS:${PN} += "python3-datetime"
-- 
2.39.2


