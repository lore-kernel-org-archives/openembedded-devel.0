Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F63CC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.56.1649865173566780370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Apgg/t8+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso2660224pjf.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cCZWmc8fzkfA3gBsBVZbwY6x71fBmLXKE6j094nr4yg=;
        b=Apgg/t8+Nm7Ad4m+LinypNE8K4sGqoCgYUhyxrwkJOm9wztnPt7JUrVr/rtAPTfE0d
         dkcZ55IMDGo/xC9docZ71YxBhRKKJX7grcdZxQbQfP3+EjthnFpE1F75lOD6aH/NFNzN
         V9yrx+Xxl1DHPk+jk9Wi5NODX7zMMYvpShHLI4tTbvmzb9fveTBoaftJn3jfI+5BPBeV
         7Sx2HRlK3y3y2yPXF4GkbnI6seQu0wMJoN3eVfgONrBN232TS11p0XDII4Z20NY9KVom
         hOrp9fDdY438RYdTjq5zZ+LjKee1+gqqRI66HGkGcSTtTwWc8VxPiTjUbQSphFf8+SQm
         /LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cCZWmc8fzkfA3gBsBVZbwY6x71fBmLXKE6j094nr4yg=;
        b=0V7L8ese5BeW/Tjts4NGAUB/hfFDCyVAAKMgROcODlRsveitPGxykk0mKGSMnLKDEy
         FaQEEF32bZmaSL5KvkLkFRLYQU81rkGZkGO1SjJToDjE0oRpq5kOv4d1jTALre8W9t1W
         o5GTAERmWdhqFy8YJAMg+G6wPp9tK3FI1o6Fi5rR6ihcInDi6a9kF5cNFXFHWSgVadYX
         TKQYBRuxVj9N89kP9EDxSGCkxdS3ABL4EHEPZYvtBiUnx2pZUJ8eaQ3IQE/tQt+uin1+
         +B4aJWXPyI1ULdVdbeGWAEyyqqCwbZihpvf5G50Ucg6O+nearOEmcJS0FaMdhcz3Z2Wu
         FFtA==
X-Gm-Message-State: AOAM533h9ctqlkpAKPN0sflcz5r4KMDXF2bqrCmbriWwbnY98+JKpsOw
	foImWCUPOSNE+goPq1sUPAiRkLdh55in2Q==
X-Google-Smtp-Source: 
 ABdhPJyt5ZNrGIlZMNpy2Ki0wzX4PJKYIa09vTer8aEHrtyHOnBQG1Pc1IL6Y/bUwGmInJcX7LDgOQ==
X-Received: by 2002:a17:90b:1a85:b0:1cd:7c49:3100 with SMTP id
 ng5-20020a17090b1a8500b001cd7c493100mr412743pjb.124.1649865172848;
        Wed, 13 Apr 2022 08:52:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm3412813pja.44.2022.04.13.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 08:52:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] gnulib: Do not use git operations to install the
 sources
Date: Wed, 13 Apr 2022 08:52:48 -0700
Message-Id: <20220413155249.3458236-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220413155249.3458236-1-raj.khem@gmail.com>
References: <20220413155249.3458236-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96618

git operations have started to fail with errors like

| fatal: unsafe repository ('/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux-musl/gnulib/2018-03-07.03-r0/git' is owned by someon
e else)
| To add an exception for this directory, call:
|
|       git config --global --add safe.directory /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux-musl/gnulib/2018-03-07.03-r0/git

This is after git has fixed a CVE in 2.35+ see [1]

[1] https://github.com/actions/checkout/issues/760

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/gnulib/gnulib_2018-03-07.03.bb    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
index 2aab68e6a5..a27968079e 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
@@ -13,18 +13,15 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
 SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
 
-SRC_URI = "git://git.sv.gnu.org/gnulib.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master \
 "
 
 S = "${WORKDIR}/git"
 
-inherit utils
-
 do_install () {
-    cd ${S}
-    check_git_config
-    git checkout master
-    git clone ${S} ${D}/${datadir}/gnulib
+    install -d ${D}/${datadir}/gnulib
+    cp --no-preserve=ownership --recursive ${S}/* ${D}/${datadir}/gnulib/
+    cp --no-preserve=ownership --recursive ${S}/.git ${D}/${datadir}/gnulib/
 }
 
 do_patch[noexec] = "1"
-- 
2.35.2


