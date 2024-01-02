Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F13C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 12:22:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.27647.1704198167392355405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 04:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AuQGUJlI;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d8909a6feso12954705e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 04:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704198165; x=1704802965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLfvx+PzKYG6gt1j8A7D58UgxhmL2FffylQ35tAJ6v4=;
        b=AuQGUJlIuFafsIoBPXStcLYOGION2Ft+xnvzqv0AMVfFlbvEP1HXktFJOfkcMT9LaC
         cis4ChQ5vZRddgy1wJ6fgmrY+183mSPjfCSDEgLoKmP+NPWBllGpqL3iRDSDjorhUX3A
         VW4yXsaUZH86Xr/70OsXk0mEaXI9YHcASz0k8imLswf9nyqMjUFs6HCL6gx1Bi1S2/U2
         /QR/Bsb9TMFcegtLERKaHjNO+Ytn1iK34x5ZVazq5TFp4Bc55Am8eY0yUnn9LaKYltRL
         Xt0L8i8p+yuRoQB1l2QSgCl3BLqdQsMjfyz36BuWaFDvUEAjtSQpxHqyaiEoTf20d3Hz
         khJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198165; x=1704802965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLfvx+PzKYG6gt1j8A7D58UgxhmL2FffylQ35tAJ6v4=;
        b=PZ4rWYaGiGA05hrQZ5aGOTE4Y3xXjunJdVl2GhQFxzSc7LG5Rkt3tiSqzYRr3oHRMK
         R6RDdjHa4BROzslxOWW3FalF9wIj14Q05LsWD/id3HQngqY0WYvBBRXJK38/OVaH85OQ
         n9Xuh5A9Sb8LB4xXDR2uBBFKE2EMbqfuPkB09NeZKCvijwuDu+n8VXwOH6DWvXaDicW9
         doxPknB4TKGXhcH/3s4dItKmVQ5z6OcEkFNaP/dLiCfu5o7icGGphscPXGhU8lcqgrbm
         oPUoJKErjBCSTRoVlSQBLvlXwoGeCD8EAZbsdtaeqKywyrIH0ABfo70qMtNTT/E45IAb
         qXnA==
X-Gm-Message-State: AOJu0Yy9uL0MFBu+ixcczfVXTiUIuZIo15lDD0P/DCbB1FTnJcdMtOer
	SbZ1WsrFAOzipae9wji1anmCCdR3Qqw=
X-Google-Smtp-Source: AGHT+IGw/Jh7aFbVfCaGC6TVoZEHqZjWpmTnUikxBN6P+R8ejDsg0xms3zn7aYv0BUlJhdgkLAuGfQ==
X-Received: by 2002:a7b:cb8d:0:b0:40d:8501:276e with SMTP id m13-20020a7bcb8d000000b0040d8501276emr1383188wmi.130.1704198165018;
        Tue, 02 Jan 2024 04:22:45 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.193])
        by smtp.gmail.com with ESMTPSA id jg7-20020a05600ca00700b0040c46719966sm51598826wmb.25.2024.01.02.04.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 04:22:44 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libpaper: upgrade 2.1.0 -> 2.1.2
Date: Tue,  2 Jan 2024 15:22:41 +0300
Message-Id: <20240102122241.52039-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 12:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108008

Changelog:

==== 2.1.2 ====

* This release contains a change only to the tests, which improves the detection of glibc.

==== 2.1.1 ====

* Fixes the -N flag of paperconf.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libpaper/{libpaper_2.1.0.bb => libpaper_2.1.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libpaper/{libpaper_2.1.0.bb => libpaper_2.1.2.bb} (74%)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb b/meta-oe/recipes-support/libpaper/libpaper_2.1.2.bb
similarity index 74%
rename from meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb
rename to meta-oe/recipes-support/libpaper/libpaper_2.1.2.bb
index 911582553..a45ffe184 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.1.2.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpaper-${PV}.tar.gz"
-SRC_URI[sha256sum] = "474e9575e1235a0d8e3661f072de0193bab6ea1023363772f698a2cc39d640cf"
+SRC_URI[sha256sum] = "1fda0cf64efa46b9684a4ccc17df4386c4cc83254805419222c064bf62ea001f"
 
 inherit perlnative autotools
 
-- 
2.25.1


