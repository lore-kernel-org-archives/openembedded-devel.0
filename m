Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E372C77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.69003.1683477203946252971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TqHiQTYx;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55d2e87048cso54955287b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477202; x=1686069202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me9CpbQnC259krrdJdqcTrRjsdFJmHtQ2zKF0N4ZAG0=;
        b=TqHiQTYxVWPhdewm8Iq7sAQpedU0g1IbJqGQYHiCnIfzHh7Pwk03Y68Evcc6pEvE+u
         vtuXsxJOWotOldEOTFT5yPFV4PBmR4Ol+vUvaZATygWvdz2lklCmN+3FdyETcGJzQFXV
         paGD4JfiH10ePUDe9wi+JKLQbRhxzzxcalrN0zKjOzeqygGMoqSugZOk+mKUe053gjHt
         sUyp4Wyb6WxFRHCeVs1JVA3xcQlVJMO3xWzVg+MHQmRDnrREUx+OukVrYzEk4ANo06ac
         gHp+fxXsGT9ePWA5gaagmjpQuo6btjlsqrvxknTC6L7iZziJUWaMPPOSsgSnweyicwtO
         ampg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477202; x=1686069202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me9CpbQnC259krrdJdqcTrRjsdFJmHtQ2zKF0N4ZAG0=;
        b=AAOQacoXAVwOlPpkXiI6vEh2Z5Se+BGISxaNYoRnC5D2hMB0S/jbhjCwgAsKvk6tpf
         JugCuFV3ArXjtPwyxGjZYfN0dkeeaBujR+CGFTwfkJFyKnwzSlIfxdHFnTG0WXSdH+FM
         eC0mDUQTniptzuUvOe6OScyBLoEObnujmGKaGvMFSrK0TcX4Knk2SkZQw8tM4PHpUN34
         iySQ79CdbZLJTPyQQzxCdusDWoFnIsNn1HRit+CT8U7QSG7MZUJLmzfhyT4IiMVJbmzD
         lxLfMnLLhzvTGtI+0n/rLb0a9nlh52ZrD6ehmcFtPmXhaIIJ0k6FFEnKKZvwBKV6irWk
         TyGA==
X-Gm-Message-State: AC+VfDzb7KBrS4j1nyBCxqmrFFx8o+PLrHPA8pPtXCGx50Pax/ie0sHV
	PjvDWIQLuvnU7FH+76XpzeoLdvZgWYA=
X-Google-Smtp-Source: ACHHUZ57csH108vgnmS8QdH8QNrK6gdf8AO2FpMuGp36bWjmCO18m8A/wTT6IJ6g+8tPQmRCM4NQyw==
X-Received: by 2002:a81:8104:0:b0:55d:7d07:7fbb with SMTP id r4-20020a818104000000b0055d7d077fbbmr8576667ywf.27.1683477202500;
        Sun, 07 May 2023 09:33:22 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 15/29] netkit-ftp: Update to debian patch 34
Date: Sun,  7 May 2023 12:32:51 -0400
Message-Id: <20230507163305.3261044-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102345

From: Khem Raj <raj.khem@gmail.com>

drop md5 SRC_URI checksums while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 29c80a7350a56b6f7c4e27ed5aa0747ca570d2fd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb           | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
index 1ba0dd46a7..31fdd9e4d8 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -6,15 +6,12 @@ LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://ftp/ftp.c;beginline=2;endline=3;md5=2d40a75a50d83b8f6317b3f53db72bfa"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}-31.debian.tar.xz;name=patch31 \
+           ${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}-34.debian.tar.xz;name=patch34 \
            file://Add_ARG_MAX_define.patch \
            file://0001-ftp-include-sys-types.h-for-u_long.patch \
            "
-
-SRC_URI[archive.md5sum] = "94441610c9b86ef45c4c6ec609444060"
 SRC_URI[archive.sha256sum] = "61c913299b81a4671ff089aac821329f7db9bc111aa812993dd585798b700349"
-SRC_URI[patch31.md5sum] = "93d71e28ce70df69e080c7f90da63cac"
-SRC_URI[patch31.sha256sum] = "4edd46a32d70daa7ba00f0ebf0118dc5d17dff23d6e46aa21a2722be2e22d1c1"
+SRC_URI[patch34.sha256sum] = "716b984bc6926ed98345fa4e68adcee2efcf08d0f7315d6be8ad6de76f255748"
 
 inherit autotools-brokensep update-alternatives
 
-- 
2.25.1


