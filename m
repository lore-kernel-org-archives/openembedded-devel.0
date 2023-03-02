Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797DEC6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:45:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.19378.1677771891240351541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 07:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=kVxCTms3;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so2080085wms.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1677771890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5AWMmuhPDr0QwScZXN6eLUKegCLDGGLpi5kWNOjnVU=;
        b=kVxCTms33XzsSOtjdLm2h+2oQ/RLHP1VEhORJmH7CqzCrZj6DN9BeM5wnBXyurNe++
         Hd89s1yscfgwKeImfc+gn2lWo1E4/TaKp39GAzMP7fQgF+2SdNzP3ZA1AS5HFr2yu3cg
         scQMqOE5fw+pHXOAzhR2URierAu78sbqAyz1nvU2ispG7inrTV9Q+3XkgUVAjv0d/29u
         xRwdWJZ0KwZ8iUiA8kiyEMlp2GpdNMMCUyiz2o4s/Fs7SnMthHnJEcqAPnzzgeqGtOD8
         vQEWct1fDdXGBnmv3ZhoPpgIFx8ssc9vbnItiv7JfRF4VKFU3pqIPbET3F8LQR/zHnHF
         tAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677771890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5AWMmuhPDr0QwScZXN6eLUKegCLDGGLpi5kWNOjnVU=;
        b=VU6RicxZSqv/JF6FZA34oU+AoEmoux40yVA7Eqjo107+TtgDR+X8A08C076crohaTw
         BerXNKKGCVhTrkkapAyx/jrT0IsUw3/ygzkAg5AejOcJHlqt7tZMb+vFsHp2J7JpjQyq
         qxIab+xMWx3MCY0cmXfDGoKDLa3l593K53kKEF+Dx+8rtH0pfOdQWo462si5zaw2W1qT
         lFR+JUtSAQjTqLcDTrogzdM/4sgLJ3XfS8P4WjmCu8s4g/uSK0q9Rtvp0XWoftHHmuCq
         Gf1Aoq24UJvmhhxAc9AfwdJ9I4nCPfl2J8jSOffmPvjH4DJ+0BU86PYz8qa8nhs58rio
         wOKQ==
X-Gm-Message-State: AO0yUKWonyunZV/NjFDpZFKS9ivKI14FaW9OURq4ug7inwfjexfSoerx
	YZXDDuja3JPhcuMIMYGxv7Diaz1ap0pedCyO
X-Google-Smtp-Source: AK7set9Un7JlqQX/xPqb2LY6nDfHTQEILI8FsAuzWBU8g8Ww6xIqn6OmdaZtWUMXtwlhZXVt+g6VHw==
X-Received: by 2002:a05:600c:1613:b0:3eb:1432:a78c with SMTP id m19-20020a05600c161300b003eb1432a78cmr7801102wmn.37.1677771889835;
        Thu, 02 Mar 2023 07:44:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:10a0:b7b3:4dd6:973c])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05600c3ca500b003dc4fd6e624sm3784719wmb.19.2023.03.02.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 07:44:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 2/2] python3-gpiod: update to v2.0
Date: Thu,  2 Mar 2023 16:44:43 +0100
Message-Id: <20230302154443.349083-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302154443.349083-1-brgl@bgdev.pl>
References: <20230302154443.349083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101337

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The final libgpiod v2.0 release is out so update the recipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/{python3-gpiod_2.0-rc3.bb => python3-gpiod_2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.0-rc3.bb => python3-gpiod_2.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.0-rc3.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
index 6af1542bf..18cf8ae8b 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0-rc3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
@@ -12,7 +12,7 @@ require recipes-support/libgpiod/libgpiod-src.inc
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "1d1756d465525deb668526571dc6ed7e08f7b8e7745b10fc028208a22fb7adf8"
+SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
 S = "${WORKDIR}/libgpiod-2.0/bindings/python"
 
 inherit setuptools3 ptest
-- 
2.37.2


