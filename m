Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EF1C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:26:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.97171.1673328374535850748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GslMie1P;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id w3so12050289ply.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 21:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJpAqASqTahckl1UgEP+Bgur9OGJx66SbVZEHjauyNs=;
        b=GslMie1PYxmBn4MVqInX2R+U1jGmz4fwjVL/tVmdtJziAbyI9MT7V3wQBI5oeQt6fR
         FSZr2tIceRznSoUUvus9t3htyM0ZH2DXew6LlPPTbc2gQLQpzq/JKLGgyilp2Op09VWo
         9Pi7r8dOIzYclTSbpppY0JYzOBx2oGuydvdI9+jo/k+MeP3nad7Rh12si/Fr77tu8dyT
         E/06Z3v6jtz0NIZYZmb7POYx7Nxpio8rWFeQqTzPwjRkgCuy/CnmnKpifU2VjjXyMGLu
         bR192W0I3tjypm1agaS8JAD3T7YGjW0qcyE8x89U49XOMWKam4fnlMwf41lveu1/7F3e
         TB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJpAqASqTahckl1UgEP+Bgur9OGJx66SbVZEHjauyNs=;
        b=z80gQisR9DsjslFOf+N3NrTFz2fz8rI2Sx4KXS1C6uEEiz9uMP+4TdGdmQEuAu+EMG
         ZnVouUwPfvHkAxiYOurXJRhXUh8oD2vIKMK6xnYynKKSxxAblCkMxI0TFWdLABl7n2mZ
         g1gpojQWKvHpyxBhy3anoV9dEk6pMZmcoREANCvu4t6292x65Lzk8xL3enJUlf8zuzgB
         OnBDcaicagaTnNlGZnSkRizMNsmG85iH2gd7UL6llxS58zZKGgU8+7th0AbNZquH6xxl
         Pf5dytgVgV4aiKYFkmmdpRNEqnnY3DYHKwIaHSveTTKfErq919yVkZLG5MLIz7QnjLWL
         Q+Dg==
X-Gm-Message-State: AFqh2koW/tTyYJSAAUvMvBDlBWjlZ+Afu8GKwSLEAM1bUS2Kx6+wrL9Q
	lDMQEMHJhrsZ1StmaklzOr6e63QgdcbOqg==
X-Google-Smtp-Source: AMrXdXt3SpT1VUQZX+rupTa0JezJMPWs18/YTLSn7glc99p/LrvZSfhTtSsLN2ApzSqFxcQZuIM3Zg==
X-Received: by 2002:a17:902:d2ce:b0:192:a4d5:55b8 with SMTP id n14-20020a170902d2ce00b00192a4d555b8mr63827968plc.52.1673328373516;
        Mon, 09 Jan 2023 21:26:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b00174d9bbeda4sm6999268plm.197.2023.01.09.21.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:26:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Update to reflect latest recipes
Date: Mon,  9 Jan 2023 21:26:10 -0800
Message-Id: <20230110052610.2599141-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100498

Some recipes are removed and some have changed PROVIDERS, adjust
accordingly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend   | 3 +--
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb     | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index ae4d38085a..43afad7515 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1,7 +1,6 @@
 RDEPENDS:packagegroup-meta-oe-devtools += "\
     python3-distutils-extra \
     rwmem \
-    speedtest-cli \
     mongodb \
 "
 
@@ -11,7 +10,7 @@ RDEPENDS:packagegroup-meta-oe-connectivity += "\
 
 RDEPENDS:packagegroup-meta-oe-extended += "\
     lcdproc \
-    mozjs \
+    mozjs-102 \
 "
 RDEPENDS:packagegroup-meta-oe-support += "\
     nvmetcli \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0bb4f7c407..20291b576d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -189,7 +189,6 @@ RDEPENDS:packagegroup-meta-oe-core = "\
     distro-feed-configs \
     mm-common \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ndctl", "", d)} \
-    opencl-icd-loader \
     pim435 \
     proxy-libintl \
     safec \
@@ -304,7 +303,6 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     rapidjson \
     squashfs-tools-ng \
     uftrace \
-    unifex \
     valijson \
     libxerces-c \
     xerces-c-samples \
-- 
2.39.0


