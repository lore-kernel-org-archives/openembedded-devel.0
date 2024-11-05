Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E06D3177D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:17:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.27157.1730830630559872895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=at6A8TRw;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so4713533b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730830630; x=1731435430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuXassOIjl08A2NgRhhrttJYRaSassEICJ3wDSVrV3I=;
        b=at6A8TRwXsm7Y0u1+mVuLisAs5Q0DE/53sAGe71X5snb1TbU+TdmBdR8CcEOMX3chp
         f/Ia8d3/tE/XA72DRyy0GL9bRxB1Mggc6J46PYpuABG+s6K+LpaA4vYJZ/NSfPXlcTSY
         n62CW+RTH+ruMag6dvXTTyl1f0qbbFqevIC4iZzi3BDrL7NuQp5bNw/xx7Rq3iudTPbE
         FgChRHrkiA17hro2vLm4yN/aMgjx4cO64MUDOLE4z4z9wBFc/TE9Uzmjh1AW4H49gHJi
         xhAzTfpZXfoQ1GshKfbfDznleU74IS0ycgFMhxX+SemJRzAlZfieZ6Pr/t1y1nGyxgCl
         r3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730830630; x=1731435430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuXassOIjl08A2NgRhhrttJYRaSassEICJ3wDSVrV3I=;
        b=QB4dUsMWiFkeU0SwMzL32S1VGMtt4rSnnhNK7ICYf+dkNoM6AtXrbw2SUHe2fiPntj
         WIHGuUjzjPBlepBxyRKSXPrRmd8A64Ke4Ula5ZreopzQhPqNchd8tamzF/txEvyTgEsp
         Su+IHJV9N+DdvENSoPjoPCJFa13D9XAEuOvgPE6AtkJSSHeNmT92lDkrdinNu8LdQLpM
         ZrcQXebGf10tq7eiBzPtz1sqrk+DWJzXWRTnWjm6FZWx81maPn2kPz5X01V9PJOvMbLx
         BQITEYGukKFGAXjX9Ig5mfeRUJRmMkSy68ynbVGo/p+FfLoAiX+Y1lKjUP1OAuAMW2no
         YFHA==
X-Gm-Message-State: AOJu0YzuunOUrMIDT8NguhcoBpMhBNRu9195xypOzbQnruOf8HFFw530
	55xxpMYZiEGsuWFUJPQ3tW9A2z5ZnjZQf7bm1WbclUIfTkKUGVczxjIhCQ==
X-Google-Smtp-Source: AGHT+IHCmY/z+dmg7XVT8U/ALoZKxCbPOvdtSkjx7w0096cjX+nPfRHwmVfCVkJt8+AQ/sQ54sfgUQ==
X-Received: by 2002:a05:6a20:9150:b0:1db:f908:f605 with SMTP id adf61e73a8af0-1dbf908f67dmr2313362637.33.1730830629581;
        Tue, 05 Nov 2024 10:17:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1c9fd4sm9939837b3a.22.2024.11.05.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:17:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] postgresql: Disable tcl support by default
Date: Tue,  5 Nov 2024 10:17:06 -0800
Message-ID: <20241105181706.2125790-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113514

It needs tcl8 and defaults have moved to using tcl9
and postgres has to be ported to work with tcl9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index ec5daeaa66..e19f2f48e2 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -55,7 +55,7 @@ pkg_postinst:${PN} () {
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
-    openssl python uuid libxml tcl perl zlib icu readline \
+    openssl python uuid libxml perl zlib icu readline \
 "
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
 PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"

