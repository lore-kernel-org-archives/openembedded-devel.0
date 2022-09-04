Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D404ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.11285.1662276903420744710
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V/hiwG8z;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id w2so5826746pld.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZiAuEwHJxqWz1DuItkBM3dolx73mEbK+XHqJLxQAaGc=;
        b=V/hiwG8zRWxsDDmo15hHSszjPvizN9qtmHoxMfuMzYpn8y6RVir5EB2uojB3Bl4u2E
         6WW68D3djqZSxH+/WPgEWu6vAgbIfwD1BXpBRTvqizJisBOp+4ufp3Aamq55rhSv3mVg
         2G39MWLVL8FRLYGyqKDi7zOo6un+mjq5KGmA4vLQdw8XoyfWOV0YbaLtvW5Ltm2l9KVk
         uKGcXDneAKNH67E6fPLC7TUQprF4WTPkBq4/GczghAIWCqBns06WjVGgUk2DH+UgdMRw
         uwfkXnfQc3ubXAI0U/db3p0R1ht/EnUR2rOsUECyU6Jb6GmFp2FAG+JvTXR1VxrociCb
         jTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZiAuEwHJxqWz1DuItkBM3dolx73mEbK+XHqJLxQAaGc=;
        b=zwJw8KTYRVmZ3pjySQuRSAsCA4obpRaUHUEk35b55Rz28bdoIkQU+YVN0TuO791VLT
         5PB0eCkAzY5EnyfqhJWL11CCBUTpp9T5wzOoPUlw69EmXnGSq/p+w3+b1aZR97iY/Fsu
         zUZf8rRedwoyJFL587/LQ4E38eGOMtVh+J0ms5YucA4B9CSZN7n2/aAk80ThCLsQIiad
         vwxOxZXblxQSHt5XiUZYj9VNZgYlMnxQeuIVNGRjXjvqipqYBA/YlPeLSUBEj3PliCWf
         xHtLzU1FUrL00zjJADS/KlBFHpGpl4CADwANRwCo7InO2rpnijtMJkHrDcO0FEKblUr3
         7Eqw==
X-Gm-Message-State: ACgBeo1+JKWpA2HN4h0YK+fVbJ1m/F0q0JBI21dtjOnzdNoeskW1o4p5
	iD8jJNiX85kXUyvF2mDXRh6BhYYEUQWVGw==
X-Google-Smtp-Source: 
 AA6agR4CLthF3HGn/8JWIBY3BF3rO5M5a5n5YJbiAaVXD7+fgxJbzpapQjeZuJ9F6AuRK4IDouCdlw==
X-Received: by 2002:a17:902:7242:b0:171:398d:9e66 with SMTP id
 c2-20020a170902724200b00171398d9e66mr43906450pll.19.1662276902632;
        Sun, 04 Sep 2022 00:35:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 41/63] scsirastools: Pass -D_LARGEFILE64_SOURCE via
 CFLAGS
Date: Sun,  4 Sep 2022 00:33:55 -0700
Message-Id: <20220904073417.3251865-41-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98635

It uses lseek64 which is enabled only with this macro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index d3f2bd678d..4fefd5169b 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -20,8 +20,7 @@ SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeab
 inherit autotools update-rc.d
 
 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
-EXTRA_OEMAKE += "CC='${CC}' sbindir=${base_sbindir}"
-
+EXTRA_OEMAKE += "CC='${CC}' CFLAGS='${CFLAGS} -D_LARGEFILE64_SOURCE=1' sbindir=${base_sbindir}"
 
 do_configure:append() {
 	oe_runmake -C mdadm.d mdadm-1.3.0
-- 
2.37.3


