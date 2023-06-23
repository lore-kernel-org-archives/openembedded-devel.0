Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB42DC001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.169.1687531180452350108
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=t/pHUnDz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.182, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b4790ff688so12565221fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531178; x=1690123178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpDIEpn4e6QtGpaMYQ7riihpGcFSgI7YLHxqeZ3lbyI=;
        b=t/pHUnDzsPC8nW0H01rytH0iO/RfbMuJvbzkM0gU6tm++Xn6ZMCeCau9uiera1s0cw
         Y4r/Vrdrj8ga9qVyc3RC+kO2jieXy/5mupDW+8tdvdZ3/idtuUimBLHP1VPOUE/jYa0i
         kxuYj8tHVb99yNOUOtm9jwaQUcxmIjlFdXDYQsA/PS4tF+FKQQ8owH+P2+s/Tt55y8ZQ
         S/FdiRQL1QdN8gpNvHg8CdThGiB9KGq3820afr9r86zkp8zzQX77qPceavrBy8D1dOTE
         A39jxFUW4Fl6wPe2me11BPfZS82M0IRorru8MI/CMtEiD1g1V38YF6Qj2NJnbmDLfIBU
         nXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531178; x=1690123178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpDIEpn4e6QtGpaMYQ7riihpGcFSgI7YLHxqeZ3lbyI=;
        b=Ju7o5yRMRFp8Jnm0yYlUgMQzaCBZk0vpFKCqgDSG2fUyBNIT9eZf28WTKRpJ+/OzWP
         2dRXj+jkE8voTUBpoEpi2m8pScgTwi3CH/49nveeWiXPLwzsxwZ+xpEMx7EJ/9hGzRJA
         dYmkT/fNuMelmQhVwQU0JJ1GTMMhfrYqsCD2PuJT/MSX5aInfyUaukgdbngRz31LeiRI
         aKeyTb0R9csgcqBG7AOT6at5ua8IGWsJrGEMQr8KrpPkG+KzZkoUdiIYHi0iXN6uR04C
         Ivem37iNB016TqAALVLTV7GFDmlvjIm91kZJU7KlbXgDRgocd5IyQz4sxJ67vMZcjyM6
         b0zg==
X-Gm-Message-State: AC+VfDyYElEsp3CGjCg/tAnR1Oj+bxs7f2069il//jezfl75oSkatpkr
	VgF3TW2dpZbD/ezB+am4UjnDpg==
X-Google-Smtp-Source: ACHHUZ7JXUE578c50F5ImMix6iZxaiKtGi2ZpM8eIBts1fQD6K5VFhNdTfaofmy79tu5ED+oe6f3CQ==
X-Received: by 2002:ac2:5b8d:0:b0:4f8:75b7:7269 with SMTP id o13-20020ac25b8d000000b004f875b77269mr7745665lfn.27.1687531178670;
        Fri, 23 Jun 2023 07:39:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 07/55] python3-pako: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:33 +0200
Message-Id: <20230623143921.146338-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103503

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pako_0.3.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
index 34cd096c9..046e6571e 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
@@ -11,3 +11,10 @@ do_install:append() {
   rm -rf ${D}${prefix}/pako/LICENSE
   rm -rf ${D}${prefix}/pako
 }
+
+RDEPENDS:${PN} += " \
+    python3-appdirs \
+    python3-io \
+    python3-json \
+    python3-logging \
+"
-- 
2.39.2


