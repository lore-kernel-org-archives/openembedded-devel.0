Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC81C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 02:46:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.15220.1683859595344552074
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 19:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NuvAp9eS;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6439df6c268so5961407b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 19:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683859594; x=1686451594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3BOx85QTSloYmpiByuGWFf+2KlkBOnR8AYVVi+m9XA=;
        b=NuvAp9eSQPLCNarmsDNsLq7uZgBiAozmfuMQCihtVwX8UKH5GBm5CfuDljYHCOq62G
         5xFIAJsVM/gVkSnmILG/Pf38jtiLHTCYzMTgreiIXL7CUC/hQ02L5nHaHgZqUBLFF5HX
         5ymHY6NzGgp6VdLJFcG6Yk7MJKvYxLSfk3/X1HBN8JqDzD/kck9Q3mMG0NRC8zSOdycB
         FgEBxiV5KH8r6lpyZEu0ghbqTGWsYwZZi9SQ+xutltp2TZYigWHaAZ0e7vTbXUmXtByJ
         3M6IVEnErPjp5+g5TqDGdVIxet+h6cc3NongDiBE2dMyoGCKvb7ocViiKhx9PdJ07KWU
         ga2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683859594; x=1686451594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3BOx85QTSloYmpiByuGWFf+2KlkBOnR8AYVVi+m9XA=;
        b=dP1S5utwLtLMBfZ5CYmN3/4R9LjawU3/bhOxcVxHmsO4zKqEAZa8gpGbgVqLgisu6n
         RxKth5PmAkdgwDJmUZtNsdfWEc5/6sVENcd0mkefNPpey+nPnkXq8syrd9vXi8ElLc0v
         x6QC38EBZdtC4c0rlOE1sMLlyQ2sjG/llfmjKcybIDq5cnYBH4kNxG29vTRBfDmXlgxJ
         h6eu8Jtkk6JofONH/1O2MMXPdxIn56v2lYI9hC5l/3J/dLKlB2nyT6RP90DzZYsE7iqp
         +SAsQJSQKSP3zO3ZjDsh9d/M6qbcpsmApNX/Q6gS0+3+cU0THjKBNk1JlnizqjIeIxi7
         1sdA==
X-Gm-Message-State: AC+VfDz3gRFfCnQ5K2T0Q1DMcQfeDZZ+6FnEJ9YiHJSQFhf8PkRyFcua
	QXAkGvOXD1i70OJoOxDA2Zn7Ny1HJxYzjw==
X-Google-Smtp-Source: ACHHUZ77FnhhIHDymse56mClnejOdN0LaYSpoA/p2T0+Tgg7UpthBclN7ENTlDGxgkVcDzDDh42vDw==
X-Received: by 2002:a05:6a00:1a56:b0:646:2e83:6b2e with SMTP id h22-20020a056a001a5600b006462e836b2emr18996142pfv.31.1683859594315;
        Thu, 11 May 2023 19:46:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id d30-20020a631d5e000000b0051baf3f1b3esm5629068pgm.76.2023.05.11.19.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 19:46:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ippool: Enable systemd service on install
Date: Thu, 11 May 2023 19:46:32 -0700
Message-Id: <20230512024632.1400-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 02:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102555

Start the daemon with RPC support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/ippool/ippool/ippool.service | 4 ++--
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb         | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/ippool/ippool/ippool.service b/meta-networking/recipes-daemons/ippool/ippool/ippool.service
index 281ae5fd19..f168e4ccb6 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/ippool.service
+++ b/meta-networking/recipes-daemons/ippool/ippool/ippool.service
@@ -5,8 +5,8 @@ After=rpcbind.service
 
 [Service]
 Type=simple
-# Start ippoold in the foreground!
-ExecStart=@SBINDIR@/ippoold -f
+# Start ippoold in the foreground! and enable RPC
+ExecStart=@SBINDIR@/ippoold -R -f
 # Normal output will go to syslog, so suppress stdout.
 StandardOutput=null
 # ExecStop is not needed. systemd will send SIGTERM
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index f592912f9b..36ea289945 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -50,8 +50,6 @@ EXTRA_OEMAKE += "IPPOOL_TEST=y"
 CPPFLAGS += "${SELECTED_OPTIMIZATION} -I${STAGING_INCDIR}/tirpc"
 
 SYSTEMD_SERVICE:${PN} = "ippool.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
 
 do_compile:prepend() {
     # fix the CFLAGS= and CPPFLAGS= in main Makefile, to have the extra CFLAGS in env
-- 
2.40.1


