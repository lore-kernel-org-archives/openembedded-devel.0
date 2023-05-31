Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CD0C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9141.1685521864251694184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=PDjuAMVg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6e72a1464so40287205e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521862; x=1688113862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twa4NRLmDbd1jlRk4UEwGddOgj3/V2jX/hjBbElxuwY=;
        b=PDjuAMVgh64aSZA+0of7+lYzGHTeTtMz/Ok2Fn4eyAAOlLMFmbRKXUnX9StDJxFnM6
         RLk38d+Fs0SuQz8SfVLDeWiBy9KF1htPz8Ae4v/tKyEoVhYZb+OTut896GLO7xSxuu5J
         /wQ91x3hfxmBUsH+3zKcNDnR0yqP3Lgke58U+hTc/VhCKM7jh0Gk0CHBUOn6APGPEKDo
         nyovX2jvK5gWx/6k8/181/ODW7sS4YJS/xopLuvEOecSV5WwYxEnWtoi0TvYYen2yHv8
         0YnpXcWHBKvvF0YnJFxXk1Zx6E7bmIJJbi/pXby4orbol2KNZDCkAyK3pz1ZF12d+Bqp
         S03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521862; x=1688113862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twa4NRLmDbd1jlRk4UEwGddOgj3/V2jX/hjBbElxuwY=;
        b=VunuPJvqUbpYBWPKO8qEJJs7N78t6f9GBVn0hgG/gdv40IAGyOU8gRuCFRM2Za8WxE
         PDnBOFzT/hJnEkPTPWsxfRN5iOksfz8aNkpemZRBeCIpYcN6SWI+qCbRKZgHjiq09AeX
         dN/ByUyCf6POdkTS/67u1lCnNb0nA7+UUMy+imi5wXjDLQniGOHwquCqGKgMPt6M3OTW
         iZ5r9/cqxhnqpxCOGA3Fj8G/Vp4/OigalY3LMFeBxIP8KtotHf7HZH6i1Pl2PcP44urI
         x4hCbdpYlP0SFtBt0cemC23fedynDZRIX2JAOmzwfof6z6JaKt+xyYN5ZNSi80eXBnO6
         OoAA==
X-Gm-Message-State: AC+VfDx+iVDWjGRRS8PjEO4Btf+U2DAp8MGYcp/MFnf7ArIseMb8eFhp
	AV4hOLyuAAfPTCDYQsnPNzOnf60rMpg6hRc9dJI=
X-Google-Smtp-Source: ACHHUZ5UHLyHCz3KY1XHqdQJbUVdt3exn6+tf76JB+AcFP/6mgUe+TYipI/D126lbEHwR98k6Kb7kQ==
X-Received: by 2002:a05:600c:3653:b0:3f4:2b1a:553b with SMTP id y19-20020a05600c365300b003f42b1a553bmr3319956wmq.28.1685521862721;
        Wed, 31 May 2023 01:31:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:31:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 099/149] python3-padaos: add missing run-time dependencies
Date: Wed, 31 May 2023 10:29:14 +0200
Message-Id: <20230531083004.11083-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103026

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb b/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
index f506a7863..3af9349d4 100644
--- a/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-padaos_0.1.10.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "dbf852015ef87a6694549779fb475b52"
 SRC_URI[sha256sum] = "2ac05fcbc826873c574568aa5ce09945d6ea987bee10399e766eb8f7c6356d72"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-logging"
-- 
2.39.2


