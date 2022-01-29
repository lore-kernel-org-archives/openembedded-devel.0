Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2368C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:21:55 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.6260.1643466115281262145
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jjdYHZgB;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id j16so8690610plx.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJB6iv8zk6YQJUH8NGgmkGs6UUD5tdIITy1j5V4QKiw=;
        b=jjdYHZgB1WzNo/hk/mKLlHEFO8xVK639795q7cO4fiStB8+CONi6BVNpfX+KDY78nR
         +acZdJEzREkLUaE8KOxV1bugdTi0K/XEUw6HN0xQ8ubdA8/QS1w0IK6TjgA1C9i83YfB
         lSNAx6DmwADYXkw+lunGsRZShwaBvUrgPB22wNkFmkdgeJpCOGZkQ0glmUGfprvus1PO
         mqrmUgMRIz3btWz/d2jphUncqD1HUxGEB5Kn+FO469PewAtDClvt0YxgihWaNycUct7r
         6TFbkl/UTT8lES3XJVtoUF6tRLJ6lwgO56StZIH5B0YWuLcaw9BjRgwqvqEqJ+ITbacJ
         /9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJB6iv8zk6YQJUH8NGgmkGs6UUD5tdIITy1j5V4QKiw=;
        b=ftC6W4wuLeaOb3mMXRC4Vtd54+DEMoRl5+Nsgp7IdRLYj0oFMlTyFafeDcvQBk+VVw
         GzZ8Sv9ysAoQOXrgf6GD21CR/jX+stbfSRkZX0fL51r0ZWu5KDNxIJVXgB8uVoM2j6Jw
         WfLyG5WKt8fDUQxM9WeLvGrWfUogVQqNX1JJfHnjUfxeaDyMfz/LTwOCzcK8t3ge6+KF
         oa2hWaIr8aFqTPfifFtStgEu4VlZQS+fzwH6RPs1SdzJq21Hkk/A+9YTGke2mvQwmFoj
         5rYzlSt5m3u4cw8Rv7WRd+eNZPRRwWDcIWbciZqJEBtNrDYtRzSnQ92QOn7fLi0WGAqH
         PGaA==
X-Gm-Message-State: AOAM531SoGOuy76kK8/23dF00LcsdpePfDH85BNwaUf4n8OAaF4EB/Mj
	uKVPu7YaTByhXJWE5zLNfX6nUSOShMHXag==
X-Google-Smtp-Source: 
 ABdhPJwI8bHHKm85k9Y3B6EpV8W2U7QVXQw4hhevHoAhuAphUg69RBKR0Gxcv60RXtLf2epIlbJjpg==
X-Received: by 2002:a17:902:c10c:: with SMTP id
 12mr13544468pli.111.1643466114655;
        Sat, 29 Jan 2022 06:21:54 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id 9sm4498304pjg.50.2022.01.29.06.21.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:21:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH 1/3] dbus-cxx: fix fetch error.
Date: Sat, 29 Jan 2022 06:21:51 -0800
Message-Id: <20220129142153.3829490-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95170

Upstream created a branch for the sources for this version.
update accordingly

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
index 79fb2f5100..099564eb34 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
 
 FILEEXTRAPATHS_prepend = "${THISDIR}/files"
-SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=dbus-cxx-0.y;protocol=https"
 SRC_URI += "file://fix_build_musl.patch"
 SRCREV = "ea7f8e361d11dc7d41d9ae2c4128aed2cdadd84e"
 
-- 
2.25.1


