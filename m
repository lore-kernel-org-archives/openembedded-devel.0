Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FFFC7EE22
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:25 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.94802.1683499456065333014
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=olLIZZPP;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-94f4b911570so598053566b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499454; x=1686091454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaQbCVxU2SqR80OEH7QkcDFWI7/86DrpmsSzlFsC44U=;
        b=olLIZZPPM/ZDHPr0pBiiArdJWGR7FgmFXRO4650O+1HngEB2C+DFjGH4b21o+lfSAV
         DFSFjJ2p7bavUyYyzvz0qhZwxQLBlXMJ9Cst7iEgl2ETmn+qO8LbSLq3s9nx55kzw49D
         fgEqr+OYaDI3d6fvjeIpoLsewExJRZsN/2bD6XgNJt88Dd+aPk6GcfeWoOBohc8DwHJ9
         koC3696EGAjm+cKVxOBfI/b9fjAPl8JNNmyIUH6ZAFaj3MIoOnI2oxaB+SP30B+KEfBJ
         24mAVcnd6KovmIgLAOC4N/+BACEBoSMxwDhQx49DJ6ZjYv8npTw0Tk9trYQp4EcclkK5
         TYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499454; x=1686091454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaQbCVxU2SqR80OEH7QkcDFWI7/86DrpmsSzlFsC44U=;
        b=dU1wdn6uIxOZnV/mTxIYMQ9S+yZBZB1AyNnyB5FlvoL8/RQOs5CvzxoYz4dv2YzL9M
         oYRZcCl+RJFqf98GMkLDIkysR69RgP+m5Nk8RzFtsUIPoQO2z3sXmgpKNcjmR65sJOZu
         pIHxV4BaCcxINvNF6R7js1vHnIBqxRvtehij+vXOlPcfXvLeEbKS3jP2dVzCrL8QFfil
         wJlZEZWj4NIPp4q0wH2sPZzzhbPGYbR1RPh3P3rNEyJ0BgKFowkeIMA1bDAXsu9FhDYP
         PNY/DmU3QBu1k5pABKQzc/wIdxgejxdR3OhlDDYHdVf++ORZPfIE93OlvBXsJMW1ZNSJ
         OJAg==
X-Gm-Message-State: AC+VfDw4IM4o4qIkjUA4tRzQjCK7O58iAg0QfrcDWVD/bfbgSBV7py9B
	thwJJumNHryJlMMrSOTWjGEeWLabw+E=
X-Google-Smtp-Source: ACHHUZ4t0tVnSaoGiNVAWu4z4v7MhwwCvFQVPr6BbqtEvweqGKSaUHP5ceztm6FQFmlIuhhzEHIiBg==
X-Received: by 2002:a17:907:7b98:b0:947:55ad:dd00 with SMTP id ne24-20020a1709077b9800b0094755addd00mr7804039ejc.26.1683499453995;
        Sun, 07 May 2023 15:44:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w11-20020a170907270b00b009600ce4fb53sm4163994ejk.37.2023.05.07.15.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/16] btrfsmaintenance: install to ${datadir}/${BPN}
Date: Mon,  8 May 2023 00:43:50 +0200
Message-Id: <20230507224354.1149327-12-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102374

* fix installed-vs-shipped with multilib:

ERROR: QA Issue: lib32-btrfsmaintenance: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/lib32-btrfsmaintenance
  /usr/share/lib32-btrfsmaintenance/btrfsmaintenance-functions
  /usr/share/lib32-btrfsmaintenance/btrfs-defrag.sh
  /usr/share/lib32-btrfsmaintenance/prepare-release.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-trim.sh
  /usr/share/lib32-btrfsmaintenance/btrfsmaintenance-refresh-cron.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-scrub.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-balance.sh
  /usr/share/lib32-btrfsmaintenance/dist-install.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-defrag-plugin.sh
  /usr/share/lib32-btrfsmaintenance/update-balance-usage-defaults.sh
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-btrfsmaintenance: 13 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
index a4573cf596..5761844f81 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
@@ -38,9 +38,9 @@ do_install() {
         ${D}${systemd_system_unitdir}
 
     install -Dm0644 ${S}/btrfsmaintenance-functions \
-        ${D}${datadir}/${PN}/btrfsmaintenance-functions
+        ${D}${datadir}/${BPN}/btrfsmaintenance-functions
     install -Dm0755 ${S}/*.sh \
-        ${D}${datadir}/${PN}
+        ${D}${datadir}/${BPN}
 
     install -Dm0644 ${S}/sysconfig.btrfsmaintenance \
         ${D}${sysconfdir}/default/btrfsmaintenance
-- 
2.40.1


