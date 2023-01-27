Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A26AC61DB3
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:02:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.101352.1674824554848630937
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Os6aSRVB;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso3402680wms.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4se8FGUitsYlQwgHpKudWCZfTTMZRBSOqX6iLKdXEk=;
        b=Os6aSRVBUpqDR6wdxQg9Cuzm1UACPXvlRNG2mo+M8YHegUOzaiNL+CFCIZGlxKuvpE
         Zjk5JMV+EE7kMFxnCny2yyt9T+xmyRqrml1yTEJe5Ks3qE9jYkxqTU6PCL2iBvg+Nwgc
         c/rywY63TLu0RB+hcomWZl/EkZf9wSz6qX5zX+AYn5vt9vtvcE6hVcYFUOZfqZQYr17k
         Q3Fz9pv6cWvuyrzCnhFiY+BSZxPbU1R0cwNuvS//4PlmHZCnHp9H5zV9i20GbfX8Czee
         JDYWlOpFH1/oMAbBLZ9ABiPoee/UnDDPD0Dp3YjE3lbAHKI10m6nc+K5ejE7CNw7g/aW
         lDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4se8FGUitsYlQwgHpKudWCZfTTMZRBSOqX6iLKdXEk=;
        b=R+7BEDxPjo0Mdz6KSdI2QPJlL5VVoZ1DXKJ1TwOAbwAHV6VZKP9TMl8RuZHFUiCU+O
         qwFxI/0z24SpvvX+RX1r2mUbZ+aXaRM8W7gRyMslGB82Ck48dSmWnaC0lgvsS9g4zNAI
         rgYXFqlN9v/0oM38lJyYCT8FTLgJMJTGVdhfgG0/gJ++vwfM3outTXYMXJO8QLOgDK80
         P9e05j4qHaAtCAnio0x/KiH4s63tmyaqbYhVQrQYw1k78YPJK8uo54CZGqCTj4kLEaxQ
         7rttjvZXC7HSnNJQG+LGS4iq0vaS10M0QogaZuzneMZArdk0pjs3qzjnVUnRnP2Q+LJe
         MtSA==
X-Gm-Message-State: AFqh2kq0lQV/CfxlcY7+2U9XN3cv5hurUIi/EUO5aaqQ1Sg8Ftm1KYCy
	rXxlt67Qz27yyKqcPNUZFvNbp/I2W4U=
X-Google-Smtp-Source: AMrXdXvtvZYgp+zfMhzjsruJhF/uGw+k+YymCxjDbMKS9VdOTKbHt20/rXCVsHABhQ9a0MA6/2nu8A==
X-Received: by 2002:a05:600c:a13:b0:3db:1de2:af31 with SMTP id z19-20020a05600c0a1300b003db1de2af31mr31753586wmp.37.1674824553350;
        Fri, 27 Jan 2023 05:02:33 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d67c9000000b00294176c2c01sm3932646wrw.86.2023.01.27.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:02:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] gphoto2: fix Upstream-Status formatting
Date: Fri, 27 Jan 2023 14:02:22 +0100
Message-Id: <20230127130225.1280161-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
References: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100818

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
index f93650f86c..fd647b7386 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
@@ -11,7 +11,7 @@ together with oe autotools.bbclass this is done twice and causes:
 | autoreconf: running: aclocal --system-acdir=/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/aclocal-copy/ --automake-acdir=/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/auto-m4/ -I /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r2/libgphoto2-2.4.11/m4m/ --force -I auto-m4 -I m4m
 | configure.ac:230: error: `po-directories' is already registered with AC_CONFIG_COMMANDS.
 
-Upstream-Status: Inapropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
-- 
2.39.1


