Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B468BC77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.87635.1682921126695013807
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cIfu3Usy;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64115e652eeso24804716b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921126; x=1685513126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEbxHQt7teSJpekyAOUY7DPbcIT/jVfhuhHP/bqPcx8=;
        b=cIfu3UsyIblgVo7J2/dz8criqCNVU9X1VhYKUpXu5RvF4JLqy5RuplZdBneKrNuQ32
         qwiqCwKSMf7jqe7rfKhc9KRO6YRGP/wjvwGuLAiJzNT5UVGH/iAmxQLqEozwRO14Anpq
         XHZCe0XM5LedLLtOC7IaiKLJsGcu0zhyfZzFlWAAbOKlH74OSll8o20ldsS/09dnwKX1
         vFc5+0/9dXXAWfmaDttOtAYmalnYWn2t6YB8Oa5asl23iBk6EeXS1UO/g33kPI+imf0h
         +LlWv3szVaaW/yedKR36/P80kTEIFuW08TjjTEN7q4Jja0oMW8NhaTK3vEQ72WnwJ0yS
         IIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921126; x=1685513126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEbxHQt7teSJpekyAOUY7DPbcIT/jVfhuhHP/bqPcx8=;
        b=HehszdNv6KIpV9COtB6ERDKgy1/2NWsYkbNJvP3bYKxskfF+ObKFBNTZb48CVEeEqN
         S4MZHIVdgKURPaFD2iQFjd5F8/4ZzjUBKp80bzGfa71dKdCgjugWcRGv9PYd6qgPsTO9
         MDDROZSzovAudLpNKLUqSGqlFLpIUIJLGlkNWFhJj038Kmlt0MKs5vJqXopeOfnU945k
         k3KWMET/nXaDbSydNtNf0j2F9VGlZfiAlDzmnRf07+5LHNzklzRjeyLqC1PtnSlvnkDw
         vwdqFPjJxHaPlQ12YLJrcLEYF33GxmV1gIZLPgEAEpEc2qdyT7LMwqlMa0PCbXB4rf7t
         qK4Q==
X-Gm-Message-State: AC+VfDw8c2WSDanAlzf224oY0ufzHgzDEbGFS97vBGARxrp9+DQ9g2e6
	SLpQcEOzITsgVhXDpmnvBD40X8/MWpsl8w==
X-Google-Smtp-Source: ACHHUZ5D/oyUwRln1SdbKVVlvoPjFHJhGmMyQkrBWkAixJphsI46YztefAIaz7TKYYWtrI8yxVddGA==
X-Received: by 2002:a05:6a21:3285:b0:ee:444a:ce1a with SMTP id yt5-20020a056a21328500b000ee444ace1amr14028848pzb.30.1682921125796;
        Sun, 30 Apr 2023 23:05:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/13] netkit-ftp: Update to debian patch 34
Date: Sun, 30 Apr 2023 23:05:13 -0700
Message-Id: <20230501060518.3505068-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102237

drop md5 SRC_URI checksums while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.40.1


