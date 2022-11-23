Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F82C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:19:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.731.1669220390895343741
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 08:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lUjk/7S8;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id 4so17116581pli.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 08:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2LHI7Ah3acznPH2fytdF0s0AcDHWGkNSSK8MOnK+5o=;
        b=lUjk/7S8HTLKHajotoRtnU36Mn8s2FZLeDYDaibHoVaRMKa57w3tlZenUW4XkVQQH9
         +H9aE7/e3PopPIyuK8e31RQaNtjRP3JzDSmcv5x9gr5tuxpkhKpRH25seMxdrChtfW+H
         4BAwuAQ23JatQhD7fukcdUfBGkbQKby9hIztFrZetdNRsES1nUshcnFKAAyLSWwDJtJb
         uFOx3d79Tw81s5oiCyBdJHKARx0FvAojw0xQAu19HeYQdwmYf+7eU2wT0AdZx6idGUPU
         2XM3iDf7295bKp/OduiXp4SXS2YPx+XbJwSJeG0WGvkkFB7y3x7RhxUfkJqZYBISp1z2
         Fr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2LHI7Ah3acznPH2fytdF0s0AcDHWGkNSSK8MOnK+5o=;
        b=5iDTgf2n+34MWYToQK0nTLs9kD1TXiVCBja6aZJECMzLpvYGekNyQ8gZ2Saa8FQo0u
         gvhvMZ3hr2n2SqKCwTT+G9Oj1ub1+cGW/IFZb4i8Ofhk9NeZXbWw+UVHWKPQ278WCDbX
         dARGtCiriwSkwr+PN4FuvIFzfUr+4VdZj7ZUwHrYDO+7/1W9sKvxbEcrRRBGLobixi7e
         E8vn2jtR6/SwddPkYGyULQ7ax3vrejI99eccSu70EJsw9WePPv5TtEj1Ez8l8IO04PJG
         lnAbhYjJ7bpvpIWVZmo8JGjJFX4cKyWaX+Rh2bgIRT3kU6VVKm2qLnCHSDnGBNd2aZEI
         hUqA==
X-Gm-Message-State: ANoB5plvSgsq31PgXacPZ5JhhM/JvAsW3RcN8idXV6hEk33kDltu/Dkf
	4kvgLCGbaQBhiDqr6JeB98ZieTrkSf4=
X-Google-Smtp-Source: AA0mqf5wbTGJRyF9RLWX7V5exXPUeWvXGOjCukE0Rpa7Zj3tmGFk3sSs8cB0V4v8/297z4z6Yq2M/g==
X-Received: by 2002:a17:90b:3d90:b0:212:de1c:a007 with SMTP id pq16-20020a17090b3d9000b00212de1ca007mr38479062pjb.30.1669220389874;
        Wed, 23 Nov 2022 08:19:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id r27-20020aa7963b000000b0056164b52bd8sm12947025pfg.32.2022.11.23.08.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:19:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] lldpd: Use github release assets for SRC_URI
Date: Wed, 23 Nov 2022 08:19:47 -0800
Message-Id: <20221123161947.3503240-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 16:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99702

media.luffy.cx seems unreliable as AB is not able to fetch it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
index c7237d74bb..6638de1ba1 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e
 DEPENDS = "libbsd libevent"
 
 SRC_URI = "\
-    http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
+    https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
     file://run-ptest \
-- 
2.38.1


