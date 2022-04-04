Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CEEC35296
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.34513.1649076141213894293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cH2skvZ8;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n6so5582214ejc.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cfkr914LoLxdXv0w2Tqfi7XRost6wo23COIVRkSV+KM=;
        b=cH2skvZ8NExjDqQOgR9MyZP62E4ZrlaxiRNHfsfS5avlFEY73/yTQOmzwNiiHW40mF
         YRzLgFUUbuc0QsX4xo7dkS3MvF0277mZI9Newzftgy7pnOZd/uoV9IHpEa+aZaLe8LVa
         9MKN4hbfXuMrUeLMMsYj1NhG0UsEp7qhXvwO6a/woha7yUaugJR0AfRVXsloUPJQpPMO
         CtAjqqsL6SS8fy3xeLjD15a5bhMcVuE1TY2hSyJKb8G4aGbFgn9L9p4TwG4KS6f4h/Vb
         ZFPX2jCSUHRCNJu9qFkHtzduGuZ0LrvE1AnUxWA1yOkgDiqadrPiwEG+avKaWt0yStpf
         OZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cfkr914LoLxdXv0w2Tqfi7XRost6wo23COIVRkSV+KM=;
        b=wQSiE52AnBmTA/IenGMUhrvlJw3nLbTqG5zjHYMNqJOUWZb2hQ4OyZc2dO1eRZcIZ9
         tKp03dGKooqYeKB89L6N5LKfi2aFzpOQSfr4TbNo7X04rRNgrnEalBH+EyMtPZ7SGaKj
         DqDc8As4SBsYHDhsrPmGjYO2AzWkj2kdCTmDxDUKG+2Cl7qW1FZeJOOA6gSKwx2Puu0j
         /m7vIRFQXHitVRJeydi5paH65bom4aS9wsL2xqZ/Jz4XMUBIfUBw0dZPYxZyqyxsgW/G
         NDJdmXSj4P9/RDuZoOK7PlaJfnmB87uU8sm2QEdzv5Iwd0Nl6QH0vuVuBQzxL4qSPiNP
         Veog==
X-Gm-Message-State: AOAM531wXtM9/vdh1unOjgv0tLsIKD4wOC6kuWFU3rHMC+Pb/aHrTSdc
	ImtO1MNk9HDFP67R1GBs4CKwCeUXuoN/9Z7C
X-Google-Smtp-Source: 
 ABdhPJyzlSDDbbWUOHpw0I61+ROfnSvdnieQF+HBagYax7etk8NDuKqGkpvizvgJl0T5kkyfZQCD2A==
X-Received: by 2002:a17:906:7316:b0:6d7:16be:b584 with SMTP id
 di22-20020a170906731600b006d716beb584mr10531857ejc.759.1649076139455;
        Mon, 04 Apr 2022 05:42:19 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-52.retail.telecomitalia.it. [82.60.178.52])
        by smtp.gmail.com with ESMTPSA id
 e6-20020a056402190600b00413d03ac4a2sm5377894edz.69.2022.04.04.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 05:42:19 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-or][PATCH] fwupd: add COMPATIBLE_HOST to match dependency
Date: Mon,  4 Apr 2022 14:42:14 +0200
Message-Id: <20220404124215.42358-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96376

Add COMPATIBLE_HOST to fix build error when musl is enabled,
this will match efivar requirements.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
index 53f1720b0..20dccc235 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
+COMPATIBLE_HOST:libc-musl = 'null'
+
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
 SRC_URI[sha256sum] = "7ebe1514acb688d2649cecc392db929094da3f03cfc98a9c0faccabb084912fa"
-- 
2.32.0


