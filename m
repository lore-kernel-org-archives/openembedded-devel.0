Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03685C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.11434.1685531592240771762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PEB+aGh2;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-561b7729a12so12292007b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531597; x=1688123597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgbTNrDfDSgXMieCTtbT2+7wApp1IxA9TqTlETwO0dc=;
        b=PEB+aGh2iynfUkyQ4N638CxPwricJWroksIxjAv9wjbsQndI1mIlqsuaKjvOXykOLi
         eT594oBTUBpDn8Rj7b6rpG5y/zt7ecGI6S93tV0kuAafCn01Cr6YNzM0glhC+Zsj0Bqd
         qhJS2SGdsfUDZnVNxLqLizaJ3m71/FRBSvuBXLt8F+1CWoCLdvMAU1MYhjqTLLbdUEEM
         qbI+AqyQCgLXrvoDOVpFdMonG71RmyQr3jQdoAwGXbTN/a0ztGvlZ3p2YfVlxj+5ar+H
         XUFq1pADUXbKiW9sCR+yHHfUSR7Zz7weUeIGXy/wfKGUEvIOHEL8Q0R+m2eQrDBZemb3
         a0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531597; x=1688123597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgbTNrDfDSgXMieCTtbT2+7wApp1IxA9TqTlETwO0dc=;
        b=U23/7l0OT81+heIRY42DmC0CwW4X+i+XkWZWGayXxgBT0oaCqYMG3iu2l9twP0MkiH
         oLrLgpme6kwtWrXHfQBz31di3Ml/gO0DE7TSrml3ib1nTPSTYkBcSqUt9rxrEUYNo8h3
         Zee1oNAPtEvCEBoeFrWBT8rqpjsZB+qNjFV2J/pYoaEW/vBwZawlfJB0gp93tGJVoXOT
         XwNwT/BfrwZkXWRBsp2ng5yzz4okhVWbnOnuiiBiMDAI8KDfb4MvG/eKy/sUfAxm1hDt
         jkkpMQbPWrt32VttK/v/mbJpYrRcN8Q8msBvaZemqfBh790WtozDwRedmKTxp/0lXKDE
         Hu0A==
X-Gm-Message-State: AC+VfDwnnpH77w5aASmDZUlCe/ZZgF4q5y6E4wHEaK8/D2JviMx4FTzK
	sJpPNOeTy8YTFlLuWSg1jda9CZypPFM=
X-Google-Smtp-Source: ACHHUZ7Z2BEB3qFYozNdtl2sPj/ci6Lj72xI26TU1GfbBVuTdDPxVWeqBMs9b+txq576+VJTACe7XQ==
X-Received: by 2002:a81:a155:0:b0:559:d19a:37ee with SMTP id y82-20020a81a155000000b00559d19a37eemr5852326ywg.15.1685531597319;
        Wed, 31 May 2023 04:13:17 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 09/36] minicoredumper: correct the sysvinit service file attribute
Date: Wed, 31 May 2023 07:12:42 -0400
Message-Id: <20230531111309.2454603-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103038

From: Mingli Yu <mingli.yu@windriver.com>

Add the execute attribute for sysvinit service file to fix the
below error:
  $ service minicoredumper status
  minicoredumper: unrecognized service

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d477cbb5267f39846d129f27d0f6a7f2b001db7b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
index 2c4111bc3e..1e8ce7e69b 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
@@ -37,7 +37,7 @@ do_install:append() {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
     install -d ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
+    install -m 0755 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
 
     # correct path of minicoredumper
     sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper
-- 
2.25.1


