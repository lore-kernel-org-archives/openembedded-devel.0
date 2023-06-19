Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CF7C0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7429.1687180988031126460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=YzjnhgbL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso10829755e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180986; x=1689772986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn/EdUsGtb3p5TDTeblzFPabIHQpK1kWXEsORjaaWLc=;
        b=YzjnhgbLuJIiXpOIGGkgEwlrUZX+dM6SfM+2BsjwH2RohUPacmWu2hsfqvD8QUJjoC
         bWOhBgQirruhZAinzdtH9ujx7PEtdRb7PNeD+/Hd09hocMiNuAmoFwim9FKRj9UCdS+q
         KjlgGM26h7sQY6kWlG55ZCHoDKo4auAQiOl75DPM2Tsb/PS7MVfdGcJSFwWSQ22+98mf
         wAqnKrfiL7OOBm5TJfM/MwKDvD2QStk4lrxDm57j+h3zIIuY+CeIFQvMw1iZoe+CshD8
         pZ4Xq1fYg5719/wOjknCKFDLxBfF0ET6aZbvKtUPplAUd00cVAxh7Vo6crsP7vfXRRzm
         +IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180986; x=1689772986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn/EdUsGtb3p5TDTeblzFPabIHQpK1kWXEsORjaaWLc=;
        b=HBZLlnSbzLU6ofeqGW/UGSLmDZWrEeLZHRqYM5eLOZhk/5agYz7G1M8rGShl980Asi
         IpDXJhTS90DzTkm3BcmyWJTf7TbpI2Cwjm02pw1hgLxV2b/qpvki7QjwBvOmLPzmoNLF
         lCNZyvq2eSR9cpqDuIaoDX4Lx6WfskccxwEluKWCXWjtbssYoKLzAsdhlj4sCxZAZSI+
         VCC5wc3zSQuJv2tzLmEZWq8pu1HDemyvdgHMZH8NberISGKCYgHdJx9Ay1/mVkxRPFKF
         qaSdiWJmVaElneBr9LcmLLOVx/vZnBoAuKIe/MhnlUEECYe98i25cxvn+JZXBjrp8voY
         zq6A==
X-Gm-Message-State: AC+VfDyI9+KhTUCfFWu3FG6dTlFiYOzEhW9NIrbqGNWl19+kLWV3y2a0
	it8uVKg8NR8MlL8FAj9nGbgy7w==
X-Google-Smtp-Source: ACHHUZ7PFOfIp4/7yuiS39meiJHcPOeMaEAzLcpaR1rMOuV0rRz7pTjcw0fe5dJHNo85ZA719vQesA==
X-Received: by 2002:a7b:c8c9:0:b0:3f9:82f:bad5 with SMTP id f9-20020a7bc8c9000000b003f9082fbad5mr4055024wml.35.1687180986581;
        Mon, 19 Jun 2023 06:23:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 44/54] python3-configobj: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:04 +0200
Message-Id: <20230619132214.213417-45-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103428

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
index fa9424a51..8dc706fdf 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -9,5 +9,6 @@ SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-pprint \
     python3-six \
 "
-- 
2.39.2


