Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A876C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9109.1685521524243439924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=xmc4+DuT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f61530506aso57685635e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521523; x=1688113523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgDRgH1UJuuCW7nUV3ihFL4t0hqsl9t+ENd28RcBIZI=;
        b=xmc4+DuTXBG5ylVqTTNnAjiOGCmzuBVdH4NX52Bo/GC9Eeh34zAaHQ8bt3/f2df8+C
         N0leLS+koneI1tfcV6PvlaLmkpOWXdilptVrH6oPm03j7kkDsTqAGop+02o4acqtP2iF
         fPouj7z4wDD4ONDMxdXzEU7i4G3Ssa9GFLXV3cqbeYOyYnZksXBoeNkNjWmhS8Y+WpgI
         NQ0E+1SbohY30bCSOjqRGSzxWQY+B9li2nhTJgD9xkbaaO9J545YZkXGd4oXL56J0tIo
         4nGtIsvKfwfoH6YMW40ssaWtBLBW0G1LVsWDcLTdPpmKr2z+0O4idmXJ+Zf9GBq1zAfe
         d4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521523; x=1688113523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgDRgH1UJuuCW7nUV3ihFL4t0hqsl9t+ENd28RcBIZI=;
        b=USz+9vXlsD3jb34nO6tgoIu8bzwzFFH0VWkJJUDNrvXEZfG5WJKPlKmfQosG42IDh1
         vWYh6eJU/UjfHo0qC+XJujcJAySn9irS5AcSuUyQH7hyACzL6Wmz0Z/oOlBd83svxKJQ
         HQd8rOy7s2i22696mHwWOVf5s/LNN6lgjERzwnOl4jf4qpwzvfTdYmqR+rIcH2GR3GCV
         N6BNzLH4TUew7znt23tlOqMPX+anAAopkrN6grD52C/CO4cacZGSETWIVaAOWouMEJn3
         l2l8QeMogQG5a2+l/BM7/cuyoZmPwLv9f3DoEB8vCMoOeKCOy/qzs0nSMHb3g4jVv8W2
         X8sw==
X-Gm-Message-State: AC+VfDw8cJLb/hABdgiO1dt4182Htl8uoHrF6usYTzJz5AfVH6hCSHtI
	X593tuk7StcTQSVfp78Hk2x+eA==
X-Google-Smtp-Source: ACHHUZ4d1bdMR+CjVVm1OY3RP+JnxudydbuDSP3klWo4F8QgoE2WEDOIFXx8AlfIP7uBmKDQB0zFig==
X-Received: by 2002:a7b:cb9a:0:b0:3f4:23a4:7a93 with SMTP id m26-20020a7bcb9a000000b003f423a47a93mr3950724wmi.25.1685521522849;
        Wed, 31 May 2023 01:25:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 015/149] python3-parse: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:23 +0200
Message-Id: <20230531082437.10646-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102942

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-parse_1.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
index 8db482e14..94c1b53c9 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.19.0.bb
@@ -10,6 +10,7 @@ inherit pypi setuptools3 ptest
 RDEPENDS:${PN} += "\
     python3-datetime \
     python3-logging \
+    python3-numbers \
 "
 
 SRC_URI += " \
-- 
2.39.2


