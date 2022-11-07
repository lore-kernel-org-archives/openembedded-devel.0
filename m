Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B807CC43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 12:38:01 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.2743.1667824672789922458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 04:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n35pdlvh;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id p127so11938903oih.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 04:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUosu3XdMIcwQ9dTRxdVDm3DdNWDDoQ2UDBcVjUlAIU=;
        b=n35pdlvhDwobPi5pneMh6eXmi9ba8SA++7oXUogUPdVfxx/uoIeer9oomgGPxLoE8Q
         wTFLk8oYzGkxg8GIEPbdj2bj9qEgkNn8cVjzQbEw2uirHwyC+rkXmJjt3PV2HcccvtVM
         G4lthuDYYNOOUSDmF/s4nyUVYYTrjs1Zt54J58QP7jj4ambEPkPdG01MinOcgTtrYDyn
         QZmZOiJoheO6q15M8tB1gqrG4zwp09nvEtYCks34NfRBDUdqEZ7Ckcg/mdEUXOEQ+VWG
         zEwOLqjXjX21b/GO5zRiwm/FKJxuiOoEgOm5Ly2z+Pclh2zoFfIh/fL2UoLtCIVR8Hsc
         g5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUosu3XdMIcwQ9dTRxdVDm3DdNWDDoQ2UDBcVjUlAIU=;
        b=eLG5JIi5Df2H6/TvDwTBlFj0Ls6mJ+m4ijqugFZtUtGF9UP1hTTu8qtQKZQ8QlfLLF
         qczRsebqbNiBG2gpCXJOT9cYBiR4GtkkJyghnD4/sys6opf/ElNSmUqydKJkC59G58a5
         we/WJZEjNlH0TyMVDIlD22J2MYlrlXS/L82y8eEMIfpTEdtNj3JAi6bg/fdS4Fnq1ZZN
         AQJ3O6mFeKXk1i2Bc5zUt+savPtuFm9gBaHpaDKDV/UGP7HFRdyaW9CDZeMWey8joerQ
         QJgpCdQ892EKcBSo6RTEcc4kJq13iFwFVYh9MVmlXC8nc2smEPdUFKKCYz/BG3uNETJC
         TLdg==
X-Gm-Message-State: ACrzQf1iU0IOcZAYs2kgfmhy6+/Q5STAgdtWjDd4hmqtj9vgHq9djSAU
	aBOXPxn6oYj3ff4ZAw6ZNGgp48r1w3vjCw==
X-Google-Smtp-Source: AMsMyM4M7uVIR+KiytoBJdg4Wt7lol4JzXYRBwSmySc2vbzGPo4D/50YXd/bMxLUh3NMnIoR0bxJ+Q==
X-Received: by 2002:a05:6808:1706:b0:351:6d17:51e0 with SMTP id bc6-20020a056808170600b003516d1751e0mr26315323oib.114.1667824671717;
        Mon, 07 Nov 2022 04:37:51 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:4ae3:e295:586e:47cb])
        by smtp.gmail.com with ESMTPSA id g9-20020a9d6189000000b0066ca7af5745sm2363980otk.26.2022.11.07.04.37.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 04:37:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [master][langdale]meta-oe][PATCH] gst-editing-services: fix typo in LICENSE field.
Date: Mon,  7 Nov 2022 07:37:49 -0500
Message-Id: <20221107123749.3205445-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 12:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99472

WARNING: gst-editing-services-1.20.4-r0 do_populate_lic: QA Issue: gst-editing-services: No generic license file exists for: GPL-2.0-on-later in any provider [license-exists]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gst-editing-services/gst-editing-services_1.20.4.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
index 37f7746846..6f76013dbd 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
@@ -4,7 +4,7 @@
 SUMMARY = "Gstreamer editing services"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-editing-services/"
 
-LICENSE = "GPL-2.0-on-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d"
 
-- 
2.25.1


