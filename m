Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D0AC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9117.1685521545500770069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=aaX4/s3r;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30aef0499b6so2273710f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521569; x=1688113569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRBO5HUb+7lXDw4v3vMG7N5bIlckjeBWmzk8NxjTbcs=;
        b=aaX4/s3rraJkWV/6ZDxSvxVtfrrTKhwXi9W4uB2o8Fr2EFUfWNRysMiKJ4cr5j75M5
         lAGExdOtPTVA0/619fv0Gyxe0VIboCKGyO1Q9TbvJBV10dWgMT6MhiBBNjghqf3xP8jg
         tcCwmk5n9zt6kQmbCS2LVVkbRiz7a8MnCCldedd89KU+Tc5ON5gzEIXm4wvEFduXj8Zt
         GmfDiN4/EMmkjqN4lX1zYDu9n9h6OI4gXKxUq+rStSZw1C2Xf8rml9+fRZz44p4R05iJ
         B7bzrVExl2XsenQZZXIO0SP2YwRMiMEzeScSJlw+17j3YehckmzEnc82HD2iShTt3PWd
         9gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521569; x=1688113569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRBO5HUb+7lXDw4v3vMG7N5bIlckjeBWmzk8NxjTbcs=;
        b=KIVL9+5UTkBD6nTTOUw3I+CJOO9VV9xNPTGge2nkcwwmD5S/CAWW/1YaQ7/84oS4Q0
         HYW4McsKEa8N0IQBoIY6vyv/Oxkgf/euxvqy1+95XKWr0UoJCYgZVvjWOswhNGBcTpmr
         X3xPSA1SU9wzc+pXmVvbOyZ3TBalhXW61aYiinKik7J3fdMnLxpEpJLvlwP3oKnisieh
         cVBYnlrjMUGkweLTldHk32g6adUA8bOgqZPD+njJ4IoW04NcyhGx+1Qjgf9GDKrGjhD6
         qO/s1e+21aaHjH/3BCPFDMVsYK4dR+pNmqDEVF0gTuQdZUUDmMmPVOqEUFFNID6du8Bj
         N8Hg==
X-Gm-Message-State: AC+VfDypx5wE7IEuPPZtgcqNRp21sQrKudOCI7hQiXdAM5+XUnnUoW0+
	tjc9mpkhsUoOuzmNnhiFjyVxow==
X-Google-Smtp-Source: ACHHUZ7ndJOHxX+mYE3Cr0LdCE8WQ6Io7p9+dq99WLwS9J6WDSlvQioBgDOe7Fl+7GOVw6igQEj71Q==
X-Received: by 2002:adf:fa41:0:b0:30a:e66f:7571 with SMTP id y1-20020adffa41000000b0030ae66f7571mr3381777wrr.4.1685521569011;
        Wed, 31 May 2023 01:26:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 056/149] python3-python-vlc: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:04 +0200
Message-Id: <20230531082437.10646-57-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102983

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-python-vlc_3.0.18122.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
index 9dd9b1480..e67e792f7 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
@@ -6,3 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI[sha256sum] = "1039bde287853b4b7b61ba22d83761832434f78506da762dfb060291bf32897d"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-logging \
+"
-- 
2.39.2


