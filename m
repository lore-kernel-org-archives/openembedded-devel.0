Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F46ACD1280
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:51:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9276.1711417860346018672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BgyXM1hB;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e0b889901bso12716275ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417859; x=1712022659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7YBUgQfgg9ElOuR3rWC2WPC1MVlpISB808rvSWSETc=;
        b=BgyXM1hBzS5XYuZorQGIjDP+aFlcylFrVfG411igsoFiOUj2Uv50agXlwb5T0vbVCk
         Um9isILDBVlZFuoDuhvJvyzvu1Ugmf79+ZxANv3ZR1ERv7zFjDcrsDc5+HpEg2MAkrVR
         Wqr1B+ypjhXEcajqeYaQeM87XEZCUq/DqAZ/8mBOp+zDqOK7tY78216Iy/pG5wK+Hj9u
         eFZXrOePvcYxLHr1W6bUnYQjwbIs9vZAi3/T7kXrrVaV8oUigMOJqjPiC6bBBOB3RTWl
         gYa6q1v0qWFxCeARkiAPlYI05bANLol3s+BrfEDwEHx0Y0xtVPK8PN52DaV0ZzF9BJ4S
         K8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417859; x=1712022659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7YBUgQfgg9ElOuR3rWC2WPC1MVlpISB808rvSWSETc=;
        b=BD/Fi7y7VeEwpR99XT8w04SxRLBXuFqWeaZYjyedKGY2Hm96/RkZIzwSERuFSS8C67
         Gg2zha4JnHLWwsQb5Gyx5BlVJebI+6OGKwKn2Z7F74YQLaJmSFkfTEkk2ynar0W+hpa2
         TAiGSbPHsSuYn2qNJ9+UY9C/mUVOXetAecRF3Csbl9KezuM5cEMfzo3odYNlz+s8lksz
         B8bLBfMN9BUcm2hgCGmO7DJDo96S+youazrybvMzV4dGUMqbzmlBkL9Zz/wt2mFLq/JA
         BDbMl3iW0rMFilWN7+wtxXtXvATdU76IJXv9QWv/HpvqbLAoCXB6/hE0r8ovkCqy22z5
         wcGA==
X-Gm-Message-State: AOJu0YyVapv03Dri96ewOQIt6K1DI0UhS+JBCwmYSTnDgFStcWnQlOQc
	y72Ir02BDataYuuIXALFWgbKDYZtajlpNe7fXlMWO9KbPOh0+8sVfETNoeIh
X-Google-Smtp-Source: AGHT+IHgRfeE1yti3P6oPK56Dma1w6TTI5pOesgG20s5LJMtaLvYbtR4oU92evZbbZd6grUv8i/gqQ==
X-Received: by 2002:a17:902:ec87:b0:1dd:a7a7:4bc1 with SMTP id x7-20020a170902ec8700b001dda7a74bc1mr9512941plg.5.1711417859497;
        Mon, 25 Mar 2024 18:50:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/10] iwd: Upgrade to 2.16
Date: Mon, 25 Mar 2024 18:50:45 -0700
Message-ID: <20240326015047.543274-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109619

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.14.bb => iwd_2.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.14.bb => iwd_2.16.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.14.bb b/meta-oe/recipes-connectivity/iwd/iwd_2.16.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.14.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.16.bb
index f190ef1988..a6bb7085ea 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.14.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.16.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "830184db5d3885ac68701cd8bb1c04d0bd8c8d3ab1c82b893b5e2bdf23329f28"
+SRC_URI[sha256sum] = "c1a82032e994861e794cf3b5a16d07ae1aa03a6674f716c73408ffeae2a233ba"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.44.0


