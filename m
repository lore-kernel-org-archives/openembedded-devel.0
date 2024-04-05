Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25420CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 12:13:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9525.1712319197654992442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 05:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jEuXyN8T;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343d1003106so879341f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712319196; x=1712923996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ+04mXaO+pM9+xAjYecFicdDq/S+M24jV0WakwDG1Y=;
        b=jEuXyN8TvHyXgRMdrYsL5caf2Po/BVf7W1zUK53MboMmqTxQDwgxSI2EJY07w/o/XF
         h3x+evLUQlpz8je8TBAaEXYg7aq5yEkKOP2bx3Qsx6f55RcTwERftBHnL2aNmN8RJ6Hf
         2Qs+/lW+MTJtbUICGhFEBT+0pMfuMyURvasZQFz3gYFRInwQRXIrZ8a7rmotKXE3B6oo
         s4MIf52nqkXtQPo/uwOQogbzEN+8kIeCxIeh5qLhn/fVioOVfmAbFaQ/Y+ufzkQ44TBt
         S/nHBhrPpMAJp4TI+QvAppKV6b5maB5vG3pZb5VpQV9hthjapDuMC/qU7AxV3DYYR4CF
         zRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319196; x=1712923996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ+04mXaO+pM9+xAjYecFicdDq/S+M24jV0WakwDG1Y=;
        b=Dvzh01GaMn2hcRp7evDfT8cVi5v7IlklMhchYS+X84HYlGx4+IFIewQAGSf6dOMEUl
         sWEZ6HsZgrymaHMSMHOtgwudn1QFWIKbPsEDO/Hn9vlqcPQ2u0leLh2YWwBiDH0lOV89
         xZ1Ggd8YRdjnDwqWmMwILnquv3AHns73yaNnTGDf45qYNA+PTyBQcOQCw3ylKWY25NdA
         kX7bS1yFgV0U0MZkqeSp2JYENCG3fx1C5++/0imvAEZ81A03fZfgnGHBZe1hrbQdF8jW
         dcBvEci2PORgvs7U4Qz6wGp0qMXAm051YhY/nkA2SO0VdhAdzrYpRdNAZTVSYshq6E2a
         f9dA==
X-Gm-Message-State: AOJu0YwIganIt4WwxutNzlAvsgTzRINWgOPeDPpnW1G0udfJpat9sA7z
	52Mrmq/n9cICtjaKBjKdKjiGbwJPWdpVz3CAR1HnuJoAz6UYZS5/RWn/1YZfPHA=
X-Google-Smtp-Source: AGHT+IGRvZrUQk3ph2i2UpbKJqzvZh782VIfwNbn47GnwXZPjnkvXEo/qEqXIub8EoSCL8Y8cpGxVQ==
X-Received: by 2002:a5d:61cb:0:b0:33e:7f51:c2f9 with SMTP id q11-20020a5d61cb000000b0033e7f51c2f9mr1112478wrv.49.1712319195825;
        Fri, 05 Apr 2024 05:13:15 -0700 (PDT)
Received: from swi-bsandu-l1.corp.ad.wrs.com (finc-23-b2-v4wan-163330-cust316.vm7.cable.virginm.net. [82.30.59.61])
        by smtp.gmail.com with ESMTPSA id t20-20020a0560001a5400b003434c6d9916sm1875861wry.110.2024.04.05.05.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:13:15 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 2.28.7 -> 2.28.8
Date: Fri,  5 Apr 2024 13:13:08 +0100
Message-Id: <20240405121308.41895-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 12:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109820

Includes security fixes for:
CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs

Full release notes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mbedtls/{mbedtls_2.28.7.bb => mbedtls_2.28.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.7.bb => mbedtls_2.28.8.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
index 9a6487ccd..301e65598 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "555f84735aecdbd76a566cf087ec8425dfb0c8ab"
-SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
+SRCREV = "5a764e5555c64337ed17444410269ff21cb617b1"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
 
-- 
2.34.1


