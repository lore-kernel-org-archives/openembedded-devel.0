Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5B1D3E77D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.30057.1730837356950938658
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jaEK8C+T;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38fa1f82fso10063407b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837356; x=1731442156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oO9Aaw7AZn2kptiR2UCbyy2x2ZQG87Dkx/SzZOZnR44=;
        b=jaEK8C+Twse+/kcwdwXsM+JeeEXUmHK/D02/MDRzUd1Fccx3AdHIJqxaCHViySrRHf
         FtOLLgcqe0Ch/VI8UIJNwe9oozJwVlbGR0WFFshYDCJ7G8Tgs19cx/8sBj8psmXqfQkE
         IG7toVmN6ytXuxAxPNlNOkE28WVbQfLHSnTTjNcvlbpEcb0ayR1b8s8DOjeL+dmlUWap
         wufKi5knAY8EZOANCOyeiXtaDvhtf4eJRenxwJdhNJFrdwS2O6wvYsv6a2cHPCxm16Xd
         +f8z26JmXTyamkdE7y4y7xcTrOUr75UdMedt/ahHBBFVGldiQva9UgygalOVXck1tevJ
         CWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837356; x=1731442156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oO9Aaw7AZn2kptiR2UCbyy2x2ZQG87Dkx/SzZOZnR44=;
        b=bEsfTncLNjYgNnkCaSxMkvyCr2eynyYONWle00zhg8WVAKq0ObWP6U+1xZP/+az2X+
         0WYAykwAulNIdb4pZGPr8qrSjB8lu8QsAbP+KCRMuqECr9kLa6pMuqlHjg5+uwyQWR25
         8x9/2ID4LCZl28zQi7jwvgFbgbRckvLoq3CJ/lADkMofyyki/F1/2sPaUZ5BQNbP2onK
         E7jEaUGmDJ8hkfjXStrMEcMpPlBGM7lvxD+vYalhP6nVc1R5ydm3jpNkwDbL1y7ikBHd
         ZwCsYhp5yxyUBZYP/PGBeb1Kem5QLAlqq2AdbnEifl9Hlb4z/6m6Kqc022yLIKeGmPhm
         1mDg==
X-Gm-Message-State: AOJu0Yzkj0guMw5xeqnQPNPFVpcnYYnJX+RKSDzynyryD5VJtdnMxH2D
	jwKq/7Sok2p4rQc5icvjAojzMGK7qxjtpq+JBaRZbJOAELw0+m+hLO6WxmMW
X-Google-Smtp-Source: AGHT+IE7f1aLgmPQEyRUvQ09OsRjShWBbnqxvJ5bowklQjtUcUF45wirroU3H1zauOB2mC17O0oUyA==
X-Received: by 2002:a05:690c:4b0e:b0:6e3:2047:58fd with SMTP id 00721157ae682-6e9d8b47cfbmr366144117b3.38.1730837355441;
        Tue, 05 Nov 2024 12:09:15 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:15 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 100/161] font-misc-misc: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:50 -0500
Message-ID: <20241105200651.39395-100-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113618

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
index 852f93602..ed314ab3c 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
@@ -13,5 +13,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c88eb44b3b903d79fb44b860a213e623"
 SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
-- 
2.43.0


