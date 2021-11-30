Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ECAC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 19:37:36 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.81600.1638301054774769621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=REfsgs8i;
 spf=pass (domain: mvista.com, ip: 209.85.215.170,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 133so2801329pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bjxP53L+yFvjUoT2aDw3fcIgZ+X0kI/Q6EGFaD/vZgQ=;
        b=REfsgs8i9THra6kJjV6TDzxWwcv8UQDBdWBr09tNvFrVJAaiRUYCb5YPmOxa7prw5k
         FBqZHRs96BHU79aycqDnxvjMJ8rj/xht9CAgpgpahRS88CBmXKJWRQ//0PLJ/5zczsRk
         RLhO4lighlsd18tDrKaq/rWJu1aPPwy9wm2fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bjxP53L+yFvjUoT2aDw3fcIgZ+X0kI/Q6EGFaD/vZgQ=;
        b=Cn4icHgcZuRU/2Cb+8WgbV9SRfXgmrO0mCT8HhA45IEVKGH5vhnTIuAPravfOCQSFy
         3mQw7cQxhSIrb0/ahdoKjBsJ/9EWaQCyYpPSh7Olzbq+expZz4dy1pl6pF+7RHkkd7VC
         ScW7jqGfWPzLkJZPYXxEAQ4fvqqwcAzTjGZBivoepGfFXnjyuI5GLWMrmHRM7tIvf5eH
         YPMvq29Q8Q8sl5L/He55lfm9ZEst5SJ+SH/zWNcIdlaObocHQTNx9QZYyU2m0E+d8DoB
         pmktmAXoKt1cSwUPPAz05/UnHwlxm7V3nAmytSzLNZgbQJ1mzmfBM2sRTTuA6dMZsH8i
         ckLQ==
X-Gm-Message-State: AOAM532d2XMoqmmOj7OxJRqtoPPXKNB2G7iRhSM5QxDCsqX0ZwIANHNJ
	W2tsmjmX1RfhCi0Envva1JzzLQ6rpE2o3Q==
X-Google-Smtp-Source: 
 ABdhPJz0iqQdKYD3SPO/gUlxOLHUwF9rD3yGNUEVvQyZkw0QOGHtsBuqYb9OcNqzgINfuDdxi0NMrg==
X-Received: by 2002:a63:6cc2:: with SMTP id
 h185mr1040796pgc.306.1638301054173;
        Tue, 30 Nov 2021 11:37:34 -0800 (PST)
Received: from blue (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 d6sm15879499pgv.48.2021.11.30.11.37.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 11:37:33 -0800 (PST)
Received: by blue (sSMTP sendmail emulation); Tue, 30 Nov 2021 14:37:31 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-networking][dunfell][PATCH] ifenslave: Add branch=main
Date: Tue, 30 Nov 2021 14:37:30 -0500
Message-Id: <20211130193730.32203-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 19:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94151

master branch has been removed upstream

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
index 0db9e8a0a..5e547a462 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
@@ -9,7 +9,7 @@ inherit manpages
 MAN_PKG = "${PN}"
 
 SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
-SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.3


