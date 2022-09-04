Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621ABC6FA8C
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.11126.1662276867029158248
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MPBP42mc;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b144so1088212pfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+8aTF4m4mXP3eUVbYHfxu4EDtorXDDWJJnndQEEnwB4=;
        b=MPBP42mcrywwaI55Kl94zLGVpfeDQh6q1qEJZcdvQ3dSlKLYI1ZhfxNP+mk6+/8Q80
         1OSjM1WHNexTu/jvKVRZugwHMg8z0BeUwzSl3Y0aoHTBEzV02vN8TJnsjQNjY0WxwMzN
         eRxEJ36OY/NZv0URvbT0aeo+caR8lVNeJtFmSu6xKI9jBGXXM+mwJMPVgJFx/vasFqei
         2lhFwZ9yeLDULfXj3Rr+q9woA1a+qm1pfont6vSFpQ4P2H1FFmzksI95lMH9FgsMykW3
         ifPWqapvHojZSb6bTq2Yl1TquucJM37zNcQ0Rm/JtLKvq35MP5sC2UpOlAIfL7f6km2b
         BeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+8aTF4m4mXP3eUVbYHfxu4EDtorXDDWJJnndQEEnwB4=;
        b=RabIKq/sXXyNwcqjN7fU4DWF8Xrs0tFCVgwr9ZeYC6PHHUAIJXygOl9hfOxWllAOHn
         h6Cd8TRH4LmLQekdbJWBsE/GKqAQhiX6bfpO4QVme1V6jf29WbuK2ANs7k5sGAxTgGI7
         rFbpDrSR5KNH1S8TxOKkpPbd8b/aQxq67850a/Po6bn9mkb6ui6guKjSohaqwJQV2Ap8
         7LuWyl2DXvDSj35tmdFO2392IZY3v+VUvkqo4eVO+Kq+EJJLpEec0VpaVCcunxPFjpXk
         pWM+ZsQjZXZEITpJxcKp3zAOpsDgkdj4yCpMPpaxIUTMMWoyuHprPTtYCN4K0aKQQu2j
         pQRg==
X-Gm-Message-State: ACgBeo17B/WRU/OxFzljcY2y/rox6GVawFzwwSF2t2rh2HOtnMcx0+co
	pK2t6im3zytShgIx1YAAP9oTysDlyJ+lZw==
X-Google-Smtp-Source: 
 AA6agR7n9yDliLuxQZLfzyWWuRsMT2OHoI2/c8/DNHFgC8epfh9rYJJmllm8IbEosEnf2UZ3yFhRLg==
X-Received: by 2002:a05:6a02:281:b0:42b:748e:5d90 with SMTP id
 bk1-20020a056a02028100b0042b748e5d90mr35631532pgb.422.1662276866192;
        Sun, 04 Sep 2022 00:34:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/63] fvwm: Disable int-conversion and implicit-int
 warnings as errors
Date: Sun,  4 Sep 2022 00:33:19 -0700
Message-Id: <20220904073417.3251865-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98599

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index 75b24bf88b..123af4d3aa 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -75,6 +75,8 @@ EXTRA_OECONF = " \
 EXTRA_OEMAKE = " \
     V=1 \
 "
+# clang treats them as errors by default now starting with 15.0+
+CFLAGS += "-Wno-error=int-conversion -Wno-error=implicit-int"
 
 do_install:append() {
     install -d -m 0755 ${D}/${sysconfdir}/xdg/fvwm
-- 
2.37.3


