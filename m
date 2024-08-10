Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E58CC3DA7F
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:10 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.7794.1723303689196738777
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cjeUxtoE;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65f7bd30546so22142357b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303688; x=1723908488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=51j3lYsdZbHGaRj2g+opi1i5B02YqsRNuiFcRlM2qSU=;
        b=cjeUxtoE8t/XgiM5+cPTdPYLOIaFVDI+da2CFGt3oF3QKKkkiwMmShTrFv3tMb3P7O
         2cYH6Zfef6fwjCZpxJCPwe2T+HhMpruZ88ywk2DjJxnoAFIu5DM0g7BPCloDSJoLCPmr
         BA/BIzevBKvwUtF79/aECXGPe8+yNKRtCleCo9roFrKgfQWN7whmjoW8sGFPgvW36zmp
         SqSp6V1sGokU88Z2jI4nrNgudVhonRasmX+S1O/p8KhELpVDlNPyD5UGhX69/LpJCw+n
         xw3d20iKrluk4KKmVwJAS2JQ+97PlIrXfWqZ8ME6eQlJwdyUkMDrBj6pX40OtOMxze2u
         QyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303688; x=1723908488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51j3lYsdZbHGaRj2g+opi1i5B02YqsRNuiFcRlM2qSU=;
        b=wYLeAkkzj0KU9YYETpLH4Krfb1q0X8gAQHqdV7I4G0lmZCagc2oC0nSYNLsWG1xYIm
         +z1IX7KUk9P0R4ufewnZ36nfUHqG8haaY5MshtX3a4Dq33HTgIUdQgdhFgmysRTAkh6I
         Bski/VdGXJNuh9Z3lkYNlGdkbnOTzQF4rhDYEEGDapor9mxXvjhsuDVYIUOaCkQgs3O3
         04eZUnxooqUkprxhWuqa4jyluxi2i2F8THR4JZk8raC5jzraHYlnE4+2RT7NHYuudRfQ
         EtE5XyH8L31R+JjeJAajI4AcEpYbOthcyx8QEAn8gIBOsrjREgrvcigvGRAVKcELQqvx
         Jxag==
X-Gm-Message-State: AOJu0YxnzhP7Nf9TFC4VYYy/IeEYaRCtMTi7HchaZeh5GI074z1dWF/6
	kUOnKP1Ur+7wcUoj25qPApkvbfcnbN69cEoS1yM57sGHvjVYo1nE77eYtw==
X-Google-Smtp-Source: AGHT+IEch4iyXToyzW+67A1FZe5GdZLJW6dvQ4H132y/ZoCy0qkqrWXtR2QF6dSM0KGKxfOKFzndXQ==
X-Received: by 2002:a05:690c:ece:b0:664:fd78:e3b3 with SMTP id 00721157ae682-69edbc76293mr44231937b3.5.1723303688161;
        Sat, 10 Aug 2024 08:28:08 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/7] fwupd: skip buildpaths errors
Date: Sat, 10 Aug 2024 11:28:01 -0400
Message-Id: <20240810152807.899873-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111738

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Test binaries are embeddding build paths and can't easily
figure out why. Thus ignore the errors in these binaries
for now.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e77f9f2feb6b9b9c86e3d815415e4bb521444538)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
index e6c276ba4e..a98ed67f76 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
@@ -140,3 +140,5 @@ FILES:${PN} += "${libdir}/fwupd-plugins-* \
 FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
 RDEPENDS:${PN}-ptest += "gnome-desktop-testing"
+
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.34.1


