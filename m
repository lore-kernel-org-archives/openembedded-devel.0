Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0B0C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 13:51:18 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.29056.1704203474782215359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 05:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DrB++OyS;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5a0dc313058so442834a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704203473; x=1704808273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlPbO/dMpxsEnXXDith4TKl5grvXn+1BIfd0LuQnbcI=;
        b=DrB++OySvyRlssgZfrVg7zXYtuCKcbMnJbsVd2xGw9ItZbdYnMftU6t/VRqR3DvjAK
         3G+d4xEnsj4/yo5MO22KeWVT1NYZRDTseJbw3ng4KMw7cCfZua0qkppen9vJ8KhGmlCn
         hdRVNSYg/1/+Wr90LpXkN93RdGTB8K8sA9LoD9iV4BoNp6cpHDToL8edCFGEhELG67Mr
         8i4xecpHOnhhb3foggIp5JXkKXNu76rYPvNkqo4HxQVHTSk5LrrSioIlKH//pa1v4qp6
         P9/ROiPo5RH5+q7t+EkXvAKBYKlpz99j4bwXjHO0XJGinxFs94znYUWNu07w+j/Iqnz/
         07wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704203473; x=1704808273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlPbO/dMpxsEnXXDith4TKl5grvXn+1BIfd0LuQnbcI=;
        b=Umbj7faE5UMj4gfbDEUuUh4I/RPIHnSHU9baTfHVNVUmDDu+/nKLhxdGuCkyGOw8S3
         hizzP9Zc+p3VxO1E5YYPpFdLA0LghQ/RlVX1UB/SLW364GUib0k16IFQSVm5EE1m+m9W
         vPHg+Yw4+GAq9MMk8EDWBEeEaLwjIupbvGE83gxROai87J+23qb2/yFBeLAp8OOohEmG
         GBlFwSq0m31+WZFz3biuOI2FdncYZewXUAPCvqap/2iFtQUITy8YO8+rl8dzzGolYRH5
         IGL7jIMDdlagQ9PWKJ6WB3B9To6bKWOMGgpxou0atEqIraJrQkw7GNAVNEbQwYjNA/wh
         Tn7g==
X-Gm-Message-State: AOJu0YwC/rryZvP7gMI5S71qfZwWzEnP/GerdRY8zzrMEZw7bQc8Tkie
	E/XZGmnAc6+sZ0fCBqN9lUXBPddnwjQ=
X-Google-Smtp-Source: AGHT+IEdov0ZHjvXKpmhGvJCKVQjVIP6jvpNDYPObI/HegfNJSJNTbA2Iue8SE/N/Rp3hjriKk16XQ==
X-Received: by 2002:a05:6a20:13c5:b0:195:2e78:d4f6 with SMTP id ho5-20020a056a2013c500b001952e78d4f6mr32901603pzc.1.1704203473598;
        Tue, 02 Jan 2024 05:51:13 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5d09:e1d2:fd71:125f])
        by smtp.gmail.com with ESMTPSA id b16-20020aa78710000000b006d9b2694b0csm15763221pfo.200.2024.01.02.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:51:13 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] i2cdev_git: Remove AUTHOR field
Date: Tue,  2 Jan 2024 10:51:06 -0300
Message-Id: <20240102135106.1604473-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 13:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108009

The AUTHOR field is no longer used in generating packages.

It may also create a possible confusion with the recipe maintainer
name, so let's remove it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
index b1f8a7f80575..b41ecffae430 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "\
     This package contains an I2C dev library and the i2c bus scanning \
     utility lsi2c. \
 "
-AUTHOR = "Danielle Costantino"
 HOMEPAGE = "https://github.com/costad2/i2cdev"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
-- 
2.34.1


