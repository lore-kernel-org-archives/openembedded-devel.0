Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2C2C7EE23
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:36:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.86339.1684150588455229830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 04:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XTOYIgy/;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f475366514so41029875e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684150587; x=1686742587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aop+32Xqx4pUbOQykbJeCX1W+mMTAKte9dI40NtESe8=;
        b=XTOYIgy/WcA1G9XU8aXYkMklK1A2jwecWs5KZSc6YyafEIfEDAuq9v/GedK20IW0ei
         PRrPib6kJhESlBSpQSpjb3J4C9DyR2/DJK8dKsH0rOLsmJDsrXlGrEhcspRkR0E7Njqi
         Ot/iukM93TFndcRVd6XK7mrKVo1Gq24aC3AOEab3Ma9/k589Kx4z6ipnqJSquWX/OfIz
         3MgoXzBKgFes5sfP3GkVjXeMIkvDMMNdeUIGVcqSF2Zhf2eswn2iym7bCxiimPRbLYSp
         pKkm1JqTnnA2pdaI7oJTDXnHmY0tOYr9JUvZJdgGh+pGnU/gbzkKUwVoP6cjZkYoK+2Q
         IvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150587; x=1686742587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aop+32Xqx4pUbOQykbJeCX1W+mMTAKte9dI40NtESe8=;
        b=Qgg9l43P8uTl25Y+Xy7wrYh8cZNPseciCgo4APVjlXbZ8bhvMovKXKNexnUo5jP0ZD
         iwxDVRVsOovPUKpUvSHfmgQdHdmo3eVT3lnqQuOg+kqFZsh12znT3V4UfKMsmUfoEPkQ
         qoBFAN0erJCsFrWD2DRol4E+6d78Rjk/KM/BU0hp1Dncd4vfzpWValC+8mfuG5AXUPYc
         2wYHqyDM5E1JxCz8Y3wnISu0RyqEF8MYxM3u96dWBWvVRru5HqbtXNGceSgmSztZYCtI
         hrOp2uM0Oej8Q9Oh0YOFRyMrA6BUt4Yqo5p7iRrdGTXPUlcegqR+hvrYbW0BgSaQ/jD+
         PmhQ==
X-Gm-Message-State: AC+VfDz7xVPlALknPJRl/9pCjLKMhfgzgxOLmHfV2k4rFtYZVCh6DndM
	O5H/G0lHizHXsT8dTlAlFezQztPF1lk=
X-Google-Smtp-Source: ACHHUZ7flIjOXx3UjSN8JcZf3S7Vr180bYg5lbWRMTDrrCeRVzQHG3WA1VLKqQEPoyluJPiaQJK5Xg==
X-Received: by 2002:a5d:4b84:0:b0:307:a7a4:441 with SMTP id b4-20020a5d4b84000000b00307a7a40441mr13353779wrt.13.1684150586709;
        Mon, 15 May 2023 04:36:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d19-20020a1c7313000000b003f508777e33sm3886668wmb.3.2023.05.15.04.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 04:36:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] libblockdev: add introspection options to UNKNOWN_CONFIGURE_OPT_IGNORE
Date: Mon, 15 May 2023 13:36:17 +0200
Message-Id: <20230515113620.42510-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 11:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102599

* fixes:
  http://errors.yoctoproject.org/Errors/Details/704197/

  ERROR: QA Issue: libblockdev: configure was passed unrecognised options: --disable-introspection [unknown-configure-option]

* since:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/gobject-introspection.bbclass?id=4e51c1815c92bb15977a3bdb14171d770da44004
  introspection.m4 doesn't get copied to ${S}/m4 without gobject-introspection-data

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
index 44b4e7daf9..f86baa21c8 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools gobject-introspection pkgconfig
 
+UNKNOWN_CONFIGURE_OPT_IGNORE = "--disable-introspection --enable-introspection"
+
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https \
 "
 SRCREV = "1412dc51c8f76bf8d9a6008228737db4a9a26d69"
-- 
2.40.1


