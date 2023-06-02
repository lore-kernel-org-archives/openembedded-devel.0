Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2ECC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:37:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.7950.1685695069249661819
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=lBWrkcdd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso1639420f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685695067; x=1688287067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tCGfEtHlVYbpyu57q7nyrqiL151OPUM6vyAu9bM2Ug=;
        b=lBWrkcdd01GdwASIQ8YF0dn0Ud8GyOPZ5W7bZ3KXnZduXhs2IuH2FYAJM5sN8wgYE+
         EVKPw4rCwOrj6NxX7au37EnIBxkDx4VZAx8oVATbbquuD3edf7+iHDs09v1tEjSpXgBS
         Mb+bYD+8jqZ2/Db65rMYOAMWRLXoRgusRVnl2QnxtLezCfcTVzh4lqEFBbX/UUT2s4/h
         DHHBcSNAxIZEDxHqQo3io+HdAORTHrxUHnjj7vlfR2AH2Ok5hmq0rf/BzH+Ed9+WG4ju
         oUENkDaUCa0UYz0OPwXcDx1Qyug1fMQp1rxsZ3rE7rH3ilhWFdhg1yjlbKzQVZ349fAu
         plsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685695067; x=1688287067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tCGfEtHlVYbpyu57q7nyrqiL151OPUM6vyAu9bM2Ug=;
        b=f+5jHhrZ6rYgYj9fWoSYaM3JxXpvSWhvSXfcLLbS50Zr9RvyDoG+Cu3WdJtBYs1w9G
         xgeFWbUzG6lO5msskPn/z7jbegdgZMAieieP4oBGLMz7aVLoy6Cg3mrH4A7CLLX9s2Ow
         Tz9nSPQNxiSO66rt9Ps8JIqvb/IAzlR90QgXPxAmNarN12F1Fn1LGeh++XdzqbV0rMvV
         uH/12EuKbbvxf9cxrzguRX7CtHj2yhBEFCWBRs5PnB41AqWVZHUBoMCQSbAeNryNVzLw
         rEjFZMfc0m7R2uQtsicQLXWj40ASnG/rbmnEZY86CE8MdOszPrLgt0+BVPQ0AAq6415u
         3F2A==
X-Gm-Message-State: AC+VfDzVqASw5Ht2olHCfbRfKVh+Q3Ji/RCwoZyNWhCBboFF+bqmSJ3B
	RGNrERr2sm6JcEwfX2me4uZuMA==
X-Google-Smtp-Source: ACHHUZ6Z0m+1aNCAHlS/KmINcr1hWYC4XW1qOCgNtT7FJsX/xdqdQfqiXbw35+7Dj/qmMaDoXTWM5Q==
X-Received: by 2002:a5d:5255:0:b0:306:3b08:6da3 with SMTP id k21-20020a5d5255000000b003063b086da3mr3899050wrc.61.1685695067477;
        Fri, 02 Jun 2023 01:37:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7569:c0c0:3a0e:c54d])
        by smtp.gmail.com with ESMTPSA id c15-20020adfe74f000000b002fae7408544sm980236wrn.108.2023.06.02.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 01:37:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] libgpiod: add myself as maintainer
Date: Fri,  2 Jun 2023 10:37:45 +0200
Message-Id: <20230602083745.560848-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 08:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103094

While RECIPE_MAINTAINER doesn't seem to be used anywhere, let's add it
in hopes that it will at least make people Cc me on any recipe patches
in the future.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index 0329caafd..a2d1f57a8 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -1,5 +1,6 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
 AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
+RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
 inherit autotools pkgconfig ptest
 
-- 
2.39.2


