Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02140C77B70
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 13:15:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.13234.1681218929343108364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 06:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=T3IaAglz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id e22so7424830wra.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ne64T+ryBMdgVEBAvpoi66rM5Nhm1k30hy8tZMcYDc=;
        b=T3IaAglzPhkJ8vA/xzs/xU/S2nM4H/Je6imAFirsl3+Ouuv2p0ydtykRLb4oAWSLr7
         5dwUrmJ7L5uBPSY9DIEqv7r9SjaDGzMD7D8maVyJWkQurt1o0rkIhCaBDr5RvoP5+4ff
         vpE64mBO6fA2YmwfQW/Yb+m9uJa0qzNHjrLqup8b0ys8VOXu5+qEwapQ6GhLL/NF0rPl
         vsU6xh0UkZ1K6X7U1gypHU9zbvRtNfgNYBDMaIvTez9VhxQXWWQCInYNg4+orAwQ4vWa
         uBBwwXNJTGOd0Xpo1aSclKQ5MZ9p5g15M0MQ9KVjPeuQsrKLzpP9gze7Df1SbdsNxgRe
         PAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ne64T+ryBMdgVEBAvpoi66rM5Nhm1k30hy8tZMcYDc=;
        b=ix0zEgDeg3HYnzmWN2x9f4ZFWbNcBh/lFtAFAwG2AKzbFICsjtC51siCQyFKKcm/b3
         lfYeHeMUykzd51OKzbiNwhiKZNv8AOodIWCHQTlG3K24+jEes1hfFUCp5+GUd+NY0V8l
         xTFTAbzCVJlHiKXWkJr+EKnVjcK68fpcHEQvad9kuqB+MkIOhdfWjkgRh6MMYj7otToA
         9d46vdXpFx4zGURI5ha1NLpDw8uYGuSJmHGaEThiv+UbTMobk7gBXUpr8BYIy7xwXP9v
         pUNX5XH7Kx7jTlDWnfvSsZNLFY3WkEbEu56QDGMh9Lc6yawSR5Oe4cVD4Q2tuUxxNudv
         MLHw==
X-Gm-Message-State: AAQBX9c1PKuQFJxFsOdOH2/xwOL7II01Gy5hHVDXOgi9fvk6HxS7Zcuc
	/VGJcY5gou8yFxURsceUaVxagw==
X-Google-Smtp-Source: AKy350b8ytrGLgW1hWmaD2Y5V3Cp0EnHJIQfWCdM6mEmkB3e9R4XfI28C9oDtlU2O2wGc9lr+O09Uw==
X-Received: by 2002:a5d:5190:0:b0:2ef:8a5a:840b with SMTP id k16-20020a5d5190000000b002ef8a5a840bmr2089474wrv.6.1681218927870;
        Tue, 11 Apr 2023 06:15:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b002efebaf3571sm7995168wrq.64.2023.04.11.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:15:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 3/4] libgpiod: generalize the local files directories
Date: Tue, 11 Apr 2023 15:15:17 +0200
Message-Id: <20230411131518.401912-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411131518.401912-1-brgl@bgdev.pl>
References: <20230411131518.401912-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102056

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to avoid having to rename the directories containing ptest
scripts on every update, use a more generic, per-major-release name and
extend the FILESEXTRAPATHS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod-1.6.4 => libgpiod-1.x}/run-ptest         | 0
 .../libgpiod/{libgpiod-2.0 => libgpiod-2.x}/run-ptest           | 0
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb              | 2 ++
 meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb                | 2 ++
 4 files changed, 4 insertions(+)
 rename meta-oe/recipes-support/libgpiod/{libgpiod-1.6.4 => libgpiod-1.x}/run-ptest (100%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod-2.0 => libgpiod-2.x}/run-ptest (100%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.6.4/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/run-ptest
similarity index 100%
rename from meta-oe/recipes-support/libgpiod/libgpiod-1.6.4/run-ptest
rename to meta-oe/recipes-support/libgpiod/libgpiod-1.x/run-ptest
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
similarity index 100%
rename from meta-oe/recipes-support/libgpiod/libgpiod-2.0/run-ptest
rename to meta-oe/recipes-support/libgpiod/libgpiod-2.x/run-ptest
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
index df0e3f104..b28aa8e69 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
 SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
 
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"
+
 inherit python3native
 
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index 4397641c7..bdfd72f2e 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
+
 SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
 
 # Enable all project features for ptest
-- 
2.37.2


