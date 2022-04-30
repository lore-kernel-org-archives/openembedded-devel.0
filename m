Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6A1C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.26018.1651346343545528397
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=awgX31GS;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id h12so9674431plf.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xzVVopD+SzBlzQhm6la6co/68XqWem3UM+bsTXziOkk=;
        b=awgX31GSpYlM2Pf9Ck0sRY15wqk+uAfQX6uvPAv8fMJlhp9GaYIQ/NVDi8sp8MW4A0
         Sj204rKjf5TiVG3dZyAeoZ9p1wBUCpiGvxaaxTAT6FnaJ3yGBLUXxXaWCmzjO5ym+kPk
         6joY6nByrs0lpdeSGUYqu7n+skB2LyonSw7iifRyRgFB2fdxz+hEtBUoerbWgu+586iR
         7QH1FiByiy0xMBECLqrP5d+w+rJbmH2Kjd2LIe1sdso6Jy/Ezpd5xCbkva5c4DIrcDAC
         NGMoXEft5vk5HTA0lwtjtph1f7RoXdsX1kEluMCvNFpEzOAvJemAKZgAGI06fSXrgyQX
         EjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xzVVopD+SzBlzQhm6la6co/68XqWem3UM+bsTXziOkk=;
        b=G6iQ78oTIBTTghYaUXyq1+gUtDhwdOJ7hl7RBubslKXuWDKsed6C1r7S7sVrCwnGn1
         eZBRLky5ximl0XQbFd5LR2h5q4m+YP9uqnHMx8kQPm89MQFvRqjCUwYMPPmDTwncRAsX
         2qzo2jZrvadihuQ6C9UEWhZE5vPacvATlToHl9N4O2iB572TBmgboHi9aT15DJkf31on
         4R2wvaUAS5QBjl2mfSnzCnY+p6L1zRPq4K4NP0QpFhxLot77ymNXodqepTkmQPBBkAs1
         v5Vqh5ZQCslGGI4ynGKqooCHY0QnqWZHBj10l73OER62Uww6LDE+agwNnhgW3e73v7go
         G+qA==
X-Gm-Message-State: AOAM532KD2z8uVcQPHnfzsSXiSmk/zKBVWxDd9VOsOp/Qs1QO36CRKhz
	j5qoy1hwDcoI8vI8sh3yI3a8Wx7D0Yv+7g==
X-Google-Smtp-Source: 
 ABdhPJyPEWddR5K1U6z6Meu3broKxLa6Lp7H8ePIMXiTKZYfW2sV8N9E078T+z1KCU/+RQQoGe5Gsw==
X-Received: by 2002:a17:90a:e7c7:b0:1d9:6a37:9f5e with SMTP id
 kb7-20020a17090ae7c700b001d96a379f5emr5307236pjb.156.1651346342684;
        Sat, 30 Apr 2022 12:19:02 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 24/39] lsscsi: upgrade 0.31 -> 0.32
Date: Sat, 30 Apr 2022 12:18:04 -0700
Message-Id: 
 <c84bdf892023996a9e1bdd50c50e99ba299c0854.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96891

From: wangmy <wangmy@fujitsu.com>

Changelog for released lsscsi-0.32 [20210505] [svn: r167]
  - improve NVMe device parsing (e.g. /dev/nvme0c1n2)
  - print nr_hw_queues when available for SCSI hosts
  - Remove blank line after NVMe device name with -HL
  - collect_disk_wwn_nodes: Fix WWN string copy
  - make WWN printing for NVMe more consistent with
    output from SCSI devices (e.g. with -u and -t)
  - logic to select best SCSI id (--scsi_id) to output
  - clean up warnings for gcc-10
  - build with autoconf 2.70

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4812d74accbfeeadb87a303e8fd1fc1eba8e2193)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} (70%)

diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
similarity index 70%
rename from meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
index 54faaa384b..9e6eb7b724 100644
--- a/meta-oe/recipes-bsp/lsscsi/lsscsi_0.31.bb
+++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM="file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://sg.danny.cz/scsi/${BP}.tgz"
 
-SRC_URI[md5sum] = "efb68946f51860e8eedc18d6784afdae"
-SRC_URI[sha256sum] = "12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca"
+SRC_URI[sha256sum] = "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1"
 
 inherit autotools
 
-- 
2.25.1


