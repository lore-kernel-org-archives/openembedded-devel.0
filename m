Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EE3C7EE29
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.87294.1682921124103448956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aj0BVIA9;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b51fd2972so1463466b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921123; x=1685513123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBKLd09IWGOtNiPeePi3qpoXiPeVnWQ0jQ7MF/5qHNI=;
        b=aj0BVIA9OrEVO5dGVCy0RG3/KD+HrvZgPU8dmFjuxlA3CsnlUAwaaik7ZTSM0xkv2u
         6atGagTGgC0zYngxP+bOTa5Uc9dcvh5cu0I2kJI1P1kEiOrM75TkcigM98RL7IGD4O6g
         GlhhFkB0ZDzYDFTMxVT5q0P8dC75HxB961yo/cTxM/1KgbG26hhvU6c+zvsJI1fUSAZG
         LZVsp/mg0Mov4pes2GM5im8JGrR3tNhKKsMrq6XL8V1cnnP3lzeCY1Gdk6M6emrUujzj
         w9+R+YPSOREmL93tSAia8Vovt1yeDq7fu6BD895Sv9gDTlbnPxJOloTKrN0z+Nu/iO9O
         NBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921123; x=1685513123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBKLd09IWGOtNiPeePi3qpoXiPeVnWQ0jQ7MF/5qHNI=;
        b=LHaRSBOaInj4DvN0I8IX5AlgMjQ7mQR5zW2VG4yQHn/d7uaSreIZ85pS/B5zm7Z6Lc
         +0vBfNsVX+ra1CTd155GHDyKogybxXgsS2Kvw7Q2pXeABF5kje2zW+CS3fPASvZBPVTH
         WTaN492kNnToXF8WIYTbJpYkp6Gsz6asJk7Ca8MX+eTQWUHIvxNVE1l2KJdf3Kt8dr3j
         kpwdRknq80jAGE5dE/fqt84ACrng0m2oyavmY+ZoHQZmmw1dFkqWoy2bL0SHq7z8umBQ
         0TtsiyTR2dIR7Sh+rv9vmnbej3eyi35Ku1j2lMeaU5sPfmEsA9wUC8towlC1j60mc2KR
         7BkA==
X-Gm-Message-State: AC+VfDw8eO/wsK8lgoReLEVGvNBwhzZ7qrdrbJQ3F6BNvYKwIg/0Jm8R
	qs3sqen+A8gb8VabfvuMdvpL0OSaUk/MIQ==
X-Google-Smtp-Source: ACHHUZ7ySfETuiwW/j0TEvhiKIhD0C9uLlNFHzsm2TzhR7TPU5pGnnyj3m5kWt1bBRGls/u5+VgjeQ==
X-Received: by 2002:a05:6a21:6d8d:b0:ef:44da:9418 with SMTP id wl13-20020a056a216d8d00b000ef44da9418mr15380757pzb.17.1682921122938;
        Sun, 30 Apr 2023 23:05:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/13] unicode-ucd: Update license URI to reflect renamed license
Date: Sun, 30 Apr 2023 23:05:09 -0700
Message-Id: <20230501060518.3505068-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102233

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index f0f3a66e07..7970cd953f 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.html;beginline=43;endline=83;md5=cf6c4777b109bcee78b6083a21be6192"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=4b11b5cbb0a24df9f4e7db63db98f22f"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.html;name=license \
+    https://www.unicode.org/license.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[license.sha256sum] = "e415e1f2188ef2b1a5f7e6ee8c60cefe8a49dacd8b96c9025cad5013985129e4"
+SRC_URI[ucd-license.sha256sum] = "f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519"
 
 inherit allarch
 
-- 
2.40.1


