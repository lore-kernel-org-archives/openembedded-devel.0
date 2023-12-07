Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB440C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 07:45:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.78971.1701935123792985777
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 23:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B+eTEglA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3332e351670so587294f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 23:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701935122; x=1702539922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Kk3X/8Z2gTwqmqdwtybPYPb+9gLXQN/7N5/VF/S8C8=;
        b=B+eTEglAd2Xsi1TmaGhHtXedB1PfEPviRWa6IqEeT42MmJYoop/4/cyY6axngsPr1e
         CF0I1bmdE/xGCaE/o6It2Yc28urt5KHs9glKxLEU5CU3crpAYgnchJ2JXou/15Mij/0I
         h165JBW1XE8fqrpecxsIwTXbeipSc/vl5D5XrfhuCd4l2wgVZGdsL4zDhoGxLZIZNIbO
         3NpNP3urAwc4ofLOLCQKIDna9iP15aLoEW05143EeIGikQrGb5xZzOEfCynKdnug2WrL
         7LWFoSzUHPjAvThtiyg1hUIC7YEJ3mAg5DwIrhCGc65zouQeuFJgFq3p3j/STKXTY5Ro
         +1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935122; x=1702539922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kk3X/8Z2gTwqmqdwtybPYPb+9gLXQN/7N5/VF/S8C8=;
        b=m0m06FU/yOswou7UBlSMFMPVia4GnJm3wZPRpklBVKPdzxPWqI2bnvNrlXLEFcGxHf
         gfUHiaNYtI/5vgncidqIBYvFu2hBk2FIHClipn+IAoKV6nMqtBlgWdcWEh0tXvEGOqeN
         ok8FLTurCMzUnvuHbsm8W3bewOY/+FIdr4vkULoOSNv8VdIMsiMxPYK1JnM65XhRhQ6M
         MTJbupQD29pdsL4JtTuMJB+GlASY6Ti4cszOGCMctgEe7B7sCZxduDdLRD/tpIUy37jr
         WDSwcDQLCm4mbaYM/+QUTcqSTL4L3ddJOdWp8B8PG0cFLCk3zkNOj+wbrAYBfBhkEY1n
         ivXw==
X-Gm-Message-State: AOJu0YyWTKG8m8Dd/QEX1hmaDDMQvmipK3apvyJO3/H60tZG3j2CXiY4
	ObrREXUM6KXHnzMD9PqwkbMVKtExYmmeyQ==
X-Google-Smtp-Source: AGHT+IFuKSfmVIhgVr8u1uPlfKjdB5DzpgusEpIyA9ZyPLORM2RffRYX8KrqPbXQKDSvCBFcM8bmkw==
X-Received: by 2002:adf:e708:0:b0:332:cea3:ac7d with SMTP id c8-20020adfe708000000b00332cea3ac7dmr615074wrm.2.1701935121527;
        Wed, 06 Dec 2023 23:45:21 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id t11-20020adfe10b000000b0033363342041sm707592wrz.23.2023.12.06.23.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:45:20 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xorg-sgml-doctools: update summary depends and inc file
Date: Thu,  7 Dec 2023 10:45:08 +0300
Message-Id: <20231207074508.18228-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 07:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107270

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc    | 9 +++++----
 .../recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb | 5 ++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
index aa4795edc..042db48ac 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
@@ -3,10 +3,11 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/docs"
 LICENSE = "MIT"
 
-SRC_URI = "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.bz2"
+DEPENDS = "util-macros-native"
 
-S = "${WORKDIR}/${BPN}-${PV}"
-
-INC_PR = "r1"
+SRC_URI_EXT = "bz2"
+SRC_URI = "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.${SRC_URI_EXT}"
 
 inherit autotools pkgconfig
+
+
diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
index 050cb2982..eef02a43e 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
@@ -1,10 +1,9 @@
 require xorg-doc-common.inc
-PE = "1"
 
-DEPENDS += "util-macros"
+SUMMARY = "SGML entities and XML/CSS stylesheets used in X.Org docs"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
 
 SRC_URI[sha256sum] = "65a9fdddedc17bd5e9c0b00d904960f03f047c3a62de5458989d493c29fec806"
 
-FILES:${PN} += " /usr/share/sgml/X11"
+FILES:${PN} += "${datadir}/sgml/X11"
-- 
2.25.1


