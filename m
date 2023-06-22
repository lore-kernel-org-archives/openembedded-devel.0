Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8BEEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 14:50:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.13360.1687445423632894093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DHruHsC3;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b52bf6e659so36253615ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687445423; x=1690037423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiZhY3T4TNMzC0x5VDNo6HKSXjG7z4uRiEx5pLcDfQQ=;
        b=DHruHsC35OkBNogHE1f5NoEqE2w1IPFyRD6+XFp1Cj9kcbVjTJy1XDNE+zpKh8b1H6
         t5Km/4AMgbGHGQciYO/45Wyn+xC4dwkjyzptxTHkA0JxwKKlitK33Y9FkAQGVPz7shlQ
         3mcjzSDmVryiW8mLJQPrQVnELswA3nOq8zVmMuKOq+bMNBGUHzlm1G4Yoa0J96VYoHpL
         anXDJFLTW7J4/PTCXtDnxabzwY2Z7XoiygimsbHrWCN/4q4d2YxtZukJO2hVzZ9eMzYt
         yoPWwqLSGJgxBI3PmSW61wUpwFW3qGHkgPT/pVsk8oAqMlBBrhXNHhlzh5lNjHSneVaK
         WqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445423; x=1690037423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiZhY3T4TNMzC0x5VDNo6HKSXjG7z4uRiEx5pLcDfQQ=;
        b=Tw1t38nwpiW7NLZcFFpyM7/8Y7Au59jYwT37OTL6tn6jYClt5KUDvKepHsgH0lEo3/
         I9UTmn7+LpuJI3Ee9se5vwjHD+5SPhncGQRjsMTraaUy8VlkeXIPPzf363qG4HRSGgGJ
         UPPaCO7yvCRoGEdoXL64ndN8iMcDyUXld4if2a2iBhR7GJ+9YBtPLJN8C3HMcPW5VFcF
         CYWWug0NTuZa1I2zG79EEio1JGOxm7M9pYik+ntLH57ovydwqqqdTIJ23FNNwHr7aB7e
         7FYeexqBCJH6jWsMDpb+T0z58XQzbhYgK1ZpOdw16Rt+kYAcxpKMsVliXoXP8nkZ/427
         Ig7A==
X-Gm-Message-State: AC+VfDysNvCFPjxmXfSH+fwxw00ciy2T7yHjId1CmVRH0F1OnuI2iVrO
	54sSM/lKGXPcipQqCt7kc33zyyeFBaA=
X-Google-Smtp-Source: ACHHUZ6vqsQxx0pupnhsSu8OSb/znKW534k/xVJe8gCkUPYLcHN4uKO8IEhA96lvNOrr7UPpVlWiLQ==
X-Received: by 2002:a17:902:e745:b0:1b6:6985:ff5f with SMTP id p5-20020a170902e74500b001b66985ff5fmr10096620plf.36.1687445422503;
        Thu, 22 Jun 2023 07:50:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902778400b0019f3cc463absm5571463pll.0.2023.06.22.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:50:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] ristretto: Upgrade to 0.13.1 release
Date: Thu, 22 Jun 2023 07:50:20 -0700
Message-ID: <20230622145020.1626471-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 14:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103489

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ristretto/{ristretto_0.12.2.bb => ristretto_0.13.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.12.2.bb => ristretto_0.13.1.bb} (81%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.12.2.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
similarity index 81%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.12.2.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
index 66836422ed..4aac89fe79 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.12.2.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
@@ -10,6 +10,6 @@ inherit xfce-app mime-xdg
 
 RRECOMMENDS:${PN} += "tumbler"
 
-SRC_URI[sha256sum] = "0eee869922ec00a253dafa446c2aad2a2f98e07e1db7262e8337ce9ec2dad969"
+SRC_URI[sha256sum] = "d71affbf15245067124725b153c908a53208c4ca1ba2d4df1ec5a1308d53791e"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.41.0


