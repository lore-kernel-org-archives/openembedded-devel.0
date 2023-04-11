Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C7CC77B74
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 13:15:32 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.13144.1681218927346901516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 06:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=yk0aV1ud;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id v29so7534365wra.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfmtd2DK631czudm1XF/IWEvTsJ5a6NNIo+KegLRsms=;
        b=yk0aV1udLqEOiJrv+fDGkWKt2of5x5KDeN+8nhPI2v/QUAP6Y+Hsn3TYMBSf28P9S+
         TbYSJmt7lgVeefcH0RxeCaluH26eH2UAn6aRxSfD8yYbgl/TGVMaSa4gkVNSSEbSylCU
         oxR+Vj+98t5C5yncYiCbi1OEP9NanQwTmQ3o8c4UU1+MGZMQU1v1GNXSMgDtAjftfGo/
         jk9fK211MKnRjQ7M4irn63LchwYbYp782XSXazpKFTVZQI7OJO2kANqjMxAQzGU+fgmQ
         Phntj+7P/zGIqWajm3lQ2NCMHpOLMCF8eNdnHCcTWBq9MB7pTKcSbz+v/rIJLqN+GF00
         o+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dfmtd2DK631czudm1XF/IWEvTsJ5a6NNIo+KegLRsms=;
        b=C8mkEHQDcg70p1kE2gTdSTgnU1wFmymyJeG5CpzhMAHVC3hcwLRZXo7pbPVsHPDkdQ
         sCUaa/lJQGDWTLWI/kNg/rn9MCOx5J1a36XCyEjzaAUV+b6UcPCuxl5ZIGUPNTLs4jcr
         sx6GCL31RSlFwxSIFTIsmiO9/4qrHKVfbtOPszGHwQ0qH+L/1Cuno5nQo5Nof2hJRYgS
         0Nkhy0Hy8oEB0Rsw1i5XkUvwe3MFkqJsneISmCoQub9a15mC4TuWpziHkhmz4mBk5mLP
         4JDS0QoJqZNTm443Dz+aNtotxm7T6NfQIdCabf66KUfRkX6DgEGCAatSS5vt13zBEYYe
         hSqQ==
X-Gm-Message-State: AAQBX9efplo/fdC2u1wP9+Rl6SSd9fESeXp55h3ZIsGFaPk1gIGEPDmF
	UAaJob8X4NHaQsHDS53NMBkhmg==
X-Google-Smtp-Source: AKy350Zjw/YmAl3rnZPDj6L2Dm/GdESb7/1vQORqFx2Z8FuU3sShV2/Nqa/+NzMKiVBPt6eMkp5OAA==
X-Received: by 2002:adf:fad1:0:b0:2d2:5971:68b0 with SMTP id a17-20020adffad1000000b002d2597168b0mr1846311wrs.22.1681218925708;
        Tue, 11 Apr 2023 06:15:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id m13-20020a5d4a0d000000b002efebaf3571sm7995168wrq.64.2023.04.11.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/4] libgpiod: enable all features for ptest
Date: Tue, 11 Apr 2023 15:15:15 +0200
Message-Id: <20230411131518.401912-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 13:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102054

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We will fail to install or run all the tests if we don't enable all the
features exposed by the libgpiod project.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
index becc9adb2..5b882149a 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.bb
@@ -11,8 +11,8 @@ SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cc
 
 S = "${WORKDIR}/libgpiod-2.0"
 
-# We must enable gpioset-interactive for all gpio-tools tests to pass
-PACKAGECONFIG[tests] = "--enable-tests --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
+# Enable all project features for ptest
+PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
 PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
 
 FILES:${PN}-tools += "${bindir}/gpionotify"
-- 
2.37.2


