Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F430C001DE
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.208.1687531214671090760
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=lAuk5dMX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso8001925e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531213; x=1690123213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF2RvzRz2bImkD1JmuSwDbzFmUGm+oyNQOWca7YVyUc=;
        b=lAuk5dMXIjfkdy0aDb6kKH9e0nlfevL5Lz0xiyxyiXuJ3aS3FQyRltOb0QtQ4Qd/Yd
         9aFKLFdRzyY0rdKvmhYPKMDWV/Rk9hR9xTWWy+6APIFS8JtgU94cueY2NmRG7XEQfPvj
         EJq1cy8g6P3b6wLb5BCDAMe8WYxXDijYxSgxqR9uNZ32A00kVHdMd/yzLpSI+zcX2DOv
         gyt9QeS+WtdHBZCTMgcin8t7T+k/daZrjJq6yv1wEyqhDcUeiZHac2ozplcqWDcAL7+f
         p6OVrxL8jK6udfeRsVVniM2w6BK+4MlkVoyLGTed9LXd0tueMLNLMjiE0MoYGBmRgE4r
         vzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531213; x=1690123213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF2RvzRz2bImkD1JmuSwDbzFmUGm+oyNQOWca7YVyUc=;
        b=SH0GzVF1O4lE9x2Vwopw+m4fP2SCqVBN2HeRoGMcSzocX0hGNGIvdcGWOuAjioQsJC
         xkbjFOeyszEOzWXdQFnw/75drAAEnA3gl244aCRvFwYwUL7/BTFzSEk241deOYqAeKG6
         FvpbY9GKBKY945pIIkr8eKK7yr0piwJ/VcGeYn5Yt5+YOZW8o2JHm5fHxt1DzBoksG8X
         pCjieFiY67DjGIGJK1hHoHJryF/d0earownTfWhU89qiBmpD/iQPvsPIlkiy8WAiRKAF
         XDIHLhHbesv8ltblvlRXNRYiUoZZ6O/U4HVxErNR12k7A0LqZEk5TZJBOXod1aySqZPn
         mtfA==
X-Gm-Message-State: AC+VfDzXBZVWZZsu3iAf7X5Y1ctH0/uzvZYuEMBCWNXacT1Ux3I1a0JC
	/VnR4dM9hO6OGEc/epeMeIjCXXhZ3MbXZWYd22E=
X-Google-Smtp-Source: ACHHUZ7y2qyBIBATgOi+Cg0XzTEQfLqhLWI8mhCNfQ8lnq4cmMt+FArRGU0pk5dnE6TihMrjh/K0/Q==
X-Received: by 2002:a1c:4c14:0:b0:3f9:b0c2:9ff7 with SMTP id z20-20020a1c4c14000000b003f9b0c29ff7mr10758830wmf.30.1687531213264;
        Fri, 23 Jun 2023 07:40:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 40/55] python3-can: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:06 +0200
Message-Id: <20230623143921.146338-41-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103536

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-can_4.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
index f5cc31d6f..5e3d54d6f 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
@@ -11,10 +11,12 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-aenum \
+    python3-asyncio \
     python3-codecs \
     python3-compression \
     python3-ctypes \
     python3-fcntl \
+    python3-json \
     python3-logging \
     python3-misc \
     python3-netserver \
-- 
2.39.2


