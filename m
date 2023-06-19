Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9803C0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.7415.1687180968067990960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=fxOkkylD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.44, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4371057e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180966; x=1689772966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgN7CtaBxaxb/LjLqZZ9xUH/FEzjD6RJeWENjHCI174=;
        b=fxOkkylDNLX27ibX+oNwONIQBBiWM2sy3gcVyXs/PFQmIiuKDT6HoEakonnfMQzpEL
         Ui7tI4nMCf4WlCXCP0ypGmmw8n+blsWAUuyLJs+7tj8HdwGpI/hHfSgf0XXX7jsHyUfg
         +JSRwGt0OS0iPysXgcG7q+wf9CQD6E7eJp7N9R8UQNDW5CK2mVTjG+4bgXrR3ynSJFMJ
         3AVoU91Y28RK/msSqJpEnMyuMOra3O6KIybuID3A/Aab6SsnOYZDf5rD0W0RwBpdQiYd
         TAVEhu9Z+epAw7xj7zeLms1ge5V5KtqFqMA6TNXPu6pki2klTMTUoiXuVJ9EwltILgbg
         zNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180966; x=1689772966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgN7CtaBxaxb/LjLqZZ9xUH/FEzjD6RJeWENjHCI174=;
        b=FLxr2FtW1JPPfhXZykfOSA4CUc+ISR/YNLPEuqTjuB6/scSiNxSQEvBuLj5qvvQtGS
         V06RRxkINvukT7PdMyZiDbj5rII9eK6NQ91ha0ELEEaet0WJNabM4HpoBJSZ4poyvPAw
         nynfr+3TYpKdA2KeRjMmYoJwf34e9USjGdYfoNhmQFCf8tlfQB7P0gzDgb3ldAliHxHp
         0IEm5fz/MnHRFxX+sPFrORHKzFcp9RTFJZh8y0rd9eItfmeL2ej6tU2qEMwvFghSkX5Y
         uzj4/ijM/WqfrOOsVX+mYB3x0RUzgZZYBgdgBIv5Hqqmw26u9jGmIAhTCVjfqxh7PLIz
         Nabg==
X-Gm-Message-State: AC+VfDxLAfJN/2DfiOBoayKX//KsYC8iyMMdesdQPtvEJE9c45GtRxoZ
	oDV+MaVrsgsQcwFCY+8wkSA1yw==
X-Google-Smtp-Source: ACHHUZ6KXNfe15QCNHOTwgwd3ZI6JGly4KytS+JlI9d6wBj0Yi4dEKueNkjCIWdC5P/KY8FmAuro8w==
X-Received: by 2002:a19:e30e:0:b0:4f4:b138:e998 with SMTP id a14-20020a19e30e000000b004f4b138e998mr4963525lfh.68.1687180966352;
        Mon, 19 Jun 2023 06:22:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 25/54] python3-gsocketpool: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:45 +0200
Message-Id: <20230619132214.213417-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103409

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index ee0ffacbd..60ac18155 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
 
-RDEPENDS:${PN} += "python3-gevent"
+RDEPENDS:${PN} += " \
+    python3-gevent \
+    python3-logging \
+"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
 SRC_URI[sha256sum] = "f2e2749aceadce6b27ca52e2b0a64af99797746a8681e1a2963f72007c14cb14"
-- 
2.39.2


