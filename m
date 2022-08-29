Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2C4ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 23:06:40 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by mx.groups.io with SMTP id smtpd.web11.5154.1661814395678925406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 16:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=oax4BoI+;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.201,
 mailfrom: 3euynywmkafoo2c8gg8d6.4ge@flex--wak.bounces.google.com)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-33dce8cae71so149542877b3.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=s79i5BRpjkadnS3F+anOjg2DotvRUd6EaopToFUbPPI=;
        b=oax4BoI+Iqc+z8BXQMBOoS8rzOnB/pMp7iXu6mRt8vby/bkNAa2pKHYSRguiiJD7kv
         yLTMgxlmcTUFPhjVMTv7UVj0kb0zajuuYnq2RhzZHPxTImQ7ZpNejAVX+QwDhbSRAWhG
         pQzakqvRC285j7DKRuuGLHepFVip/eHTBlr5XLTcUU69zXB6yuASHCUEjjUUyQvi8xIr
         Zaao2hLzRO9Ow0mq47eZwf6DeJN8bdUNsNlueZ+vmAVl8SutRAiTQT2uUqf0M5ZWdTPF
         P2Hd2AaGiqZFmiNudZ00NRXf68Zdg2C3CjlNccWP3xLaHbn0UEcrJvBWt6si0pTsDLnp
         ZQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=s79i5BRpjkadnS3F+anOjg2DotvRUd6EaopToFUbPPI=;
        b=IeKvLkdH54uQzX/hHq2PUS9vUpKTpWFIkJNDxkdXwW5mFFYBDkDF8WgLyqgn1kzbeb
         TRSMk8aQ9Ax2lzLvKHoKCkGet2G7qzeb+d6OU4XGYdIMXMcNuh8ztlgEi7ByPzQZsA0B
         106G2BH+4Z3rftpHtSz28T4Mq4dDBHn97xjPHp3+1RY+fd5DFS1GIMQGGCi0ti/Whie2
         btP6RLyP0ScU60GPsfZcPhupAhMaWZ5dRV3W2G5s9DA3jQNNFRBcPwPR15jHppB1t2Te
         V7ZgUqWkk3iyj4JzTG6hB5bpJhmZ4PUksUQOkzj1CGM6+X5Vfb2do4YyoZR4gMwOu1Vn
         jykg==
X-Gm-Message-State: ACgBeo1V5vO5wCd1S4lO4l7d1O1S/tua91AwxHByS4xoSNHJv1ELmMnV
	3tLwoHkA3JoVsK0ryxQq1k33Du8y5KqBbOeYxHk2Ap9M5SutSWLXy05JAmsIcmKB4xmsNPmxWeo
	o59t/0oxNtgyG1MuTINKodA+xMFLWHqpkIUEY2J+SS4891Qk3nzklXc6huk9Bxdcz3BmmiDsBs4
	0DsXs=
X-Google-Smtp-Source: 
 AA6agR6EUrdti+vfZXqwkbJK8ehi+aHTMkdgMKaSwydAjaPjSOKj8H+dFHRyTsREbMhhzMrgKAAF3Lo=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:f09:65fb:3a24:a5b4])
 (user=wak job=sendgmr) by 2002:a25:258d:0:b0:695:b094:96c6 with SMTP id
 l135-20020a25258d000000b00695b09496c6mr9222456ybl.502.1661814393672; Mon, 29
 Aug 2022 16:06:33 -0700 (PDT)
Date: Mon, 29 Aug 2022 16:06:29 -0700
Message-Id: <20220829230629.661835-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [meta-oe][PATCH] image_types: Set SOURCE_DATE_EPOCH for squashfs
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 23:06:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98537

We want to use the reproducible timestamp for all of the files that is
set rootfs-postcommands.bbclass, derived from
REPRODUCIBLE_TIMESTAMP_ROOTFS. Without this, we use a hardcoded time
that is built into the squashfs sources.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/classes-recipe/image_types.bbclass | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index a731e585b2..764e6a5574 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -109,11 +109,19 @@ IMAGE_CMD:btrfs () {
 	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 }
 
-IMAGE_CMD:squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD:squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
-IMAGE_CMD:squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
-IMAGE_CMD:squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4"
-IMAGE_CMD:squashfs-zst = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-zst ${EXTRA_IMAGECMD} -noappend -comp zstd"
+oe_mksquashfs () {
+    local comp=$1
+    local suffix=$2
+
+    # Use the bitbake reproducible timestamp instead of the hardcoded squashfs one
+    export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
+    mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs${comp:+-}${suffix:-$comp} ${EXTRA_IMAGECMD} -noappend ${comp:+-comp }$comp
+}
+IMAGE_CMD:squashfs = "oe_mksquashfs"
+IMAGE_CMD:squashfs-xz = "oe_mksquashfs xz"
+IMAGE_CMD:squashfs-lzo = "oe_mksquashfs lzo"
+IMAGE_CMD:squashfs-lz4 = "oe_mksquashfs lz4"
+IMAGE_CMD:squashfs-zst = "oe_mksquashfs zstd zst"
 
 IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs ${IMAGE_ROOTFS}"
 IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.erofs-lz4 ${IMAGE_ROOTFS}"
-- 
2.37.2.672.g94769d06f0-goog


