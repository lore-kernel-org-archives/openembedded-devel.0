Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B6AC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 10:24:42 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.4531.1657103066332458239
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kOXeo1D7;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id eq6so18652378edb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qeQMC28TeCmCkBWDJprXzHTNjz2BcmuecLQb1/OPTio=;
        b=kOXeo1D7LQjCSdltRTnJlfHQR3VEZ9+VszMT8A4LE/Lv6JMwZWYl6Kdzz7sHlXJ8tj
         INS8J8Y79m9D0huMoeHMLx4Oc9ybo0MJnt7JplHMyUDdgWZMZTi+Tp+J7yAR7yCRN1Oc
         7jEalzbWyTiFw9TmGA9jtVg3Ka3ZmNhCHm4YJy/pJ/HCiufB0/PDBCm2+4U/ETsc8U6s
         3FUskRLGPCRUSEIVQxoEx9xbFPw2ez9lIUvkyrNC7DwTQWUUotGpvza8yafMZhhnB9or
         JpzEOZQ+U0DCeVMmw9Fa1CwE71LTTTpGMbCAArbpYICmuEsJnmlH4kcntGLC5sChtlyS
         fm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qeQMC28TeCmCkBWDJprXzHTNjz2BcmuecLQb1/OPTio=;
        b=Q3hsFXz3fkj0se0riktrhfTmGKJLO4f5Ql+LmlgdHPGCGioYjh1cpD8uqvzlOUnZFR
         5Ma/sTNx9G9arD5cIlwJz4Z3XilXZgpb4Z2Z6o4fQp7vSqinCp3H6N4ur2XAZoHJ+u/q
         THEjl5XoGVm6cVNOlBxB+PP47to3RchojZW4MQEbWLUDcMHUx1z5B2Q/rbGPAowBnZyW
         VmmLvJCgOQNNCIUjtvBJcOabnL7j0/nrJ+RywbdiwdvKSxOioCaJGk61dz1BS6FrZqD/
         rX2Dx97364SK4/DVc2JHwxTENxUi1zGRHXXaHIM0TSol/HuGQGRLTxjvSta2jkyn+GUk
         jltQ==
X-Gm-Message-State: AJIora+XGe29ZWtoOt7nIS4oV7zwo6fGkoNRB/b3WaM/QeF+oH6nawpA
	X1Hs9teBo91O0s8pTjWm9Srt7PkIgMw=
X-Google-Smtp-Source: 
 AGRyM1sKeC1/IcmUW7pfr+vSGcAgUZNZ0gGG17p31W+ka2TiT8xhDfaRSTCPjdoDsRDXeFXyOcvmRg==
X-Received: by 2002:aa7:cd0a:0:b0:43a:8ffd:d8de with SMTP id
 b10-20020aa7cd0a000000b0043a8ffdd8demr1355319edw.5.1657103064185;
        Wed, 06 Jul 2022 03:24:24 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 bg6-20020a170906a04600b00722e31fcf42sm17107161ejb.184.2022.07.06.03.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 03:24:23 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-networking][kirkstone][master][PATCH] quagga: ignore
 CVE-2016-4049
Date: Wed,  6 Jul 2022 12:24:19 +0200
Message-Id: <20220706102419.22553-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 10:24:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97729

CVE-2016-4049 is not affecting our version, so we can ignore it.
This is caused because the CPE in the NVD database doesn't specify
a vulnerable version range.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
index a7697a1ae..984264a30 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
@@ -2,3 +2,7 @@ require quagga.inc
 
 SRC_URI[md5sum] = "eced21b054d71c9e1b7c6ac43286a166"
 SRC_URI[sha256sum] = "e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3"
+
+CVE_CHECK_IGNORE += "\
+    CVE-2016-4049 \
+"
-- 
2.34.1


