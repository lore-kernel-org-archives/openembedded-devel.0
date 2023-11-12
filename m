Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430A2C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 11:00:41 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.13024.1699786840615295735
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 03:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JihovOZN;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50949b7d7ffso5092432e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 03:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699786838; x=1700391638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hao18T/mwCGVsn03Gwj5ursrMxYY42C08/qMJEAfD8g=;
        b=JihovOZNT6XIzGYFmbI98wEUzmhmOZBticNNrcz46hZtJlzV6qmrPSNz9zY3zCXrJS
         x8a4Vfowjsdd+qh3o5/hRfbSTecskFzhAOAU0vX4xnnma2y7TtKtd7jQpbM+qoub3zcC
         YftcN29rcdY7mO5f7/93xHsXuIXW9tLFF6N4lPvMy+xS0tZQWZMrCQHJJXDDiATq3MOR
         6c3qr+4xvoz7/Kvt83SXUL/KpBtztQWvLptzL/bZjpcW4/Y+fscTdfCKUNBoAbm4FZNh
         gv26ae66qkB96UEAM7OzyezemaRxXPslxVMBWh7NiZPpwVyslH9OiHP/l/cdKnsag9U5
         cUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699786838; x=1700391638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hao18T/mwCGVsn03Gwj5ursrMxYY42C08/qMJEAfD8g=;
        b=IOjV4qrf+Va8KMQax3CnVyJ5dTImeHT3Zpoqzhn9Zhr6Fh4ccZMc9zM010Q2NdxaOX
         9qabd1wF3TGTjBG+Mo7eaxBJuMb07jzrUwkmM7gkhZvSXugCx6UhKSMTJ3AzzGne+Cpx
         khBF10/cpKIu+cje1O+1L8N+9Dx3zEUI6qUpSGwgADP3rMgH5/wzMLaPNJmWNuvLAa21
         6eZr31Lnd8nt6SO1CtzmGAGSYx1GKAEz652wPgWXc98U5ptNBx7cSvlIRZL2nzWekio/
         EY+QwP5CiS0es+qcjt+sXDd8RQxb04X0+mI/5smYYm2HyJCaRnoRV0hVEa0baRDmvENI
         p7vg==
X-Gm-Message-State: AOJu0YxNEhBKa1oBkv7Gs4oCS0Rl1v9f95FgDpb/Bmewm393GHsQIpMv
	g7oqzHOQaE8N45npqatu01Vyp1iwDWGvAg==
X-Google-Smtp-Source: AGHT+IEaRCVIcdE/GPMqWMj5E0IELv6vK9u0EhSYNPE2GOw/tZYF5yPXQ0hBpXBVFxKtjrg3dOS2Qw==
X-Received: by 2002:a19:4357:0:b0:509:4439:9b57 with SMTP id m23-20020a194357000000b0050944399b57mr2243061lfj.38.1699786838071;
        Sun, 12 Nov 2023 03:00:38 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id er22-20020a056402449600b0054130b1bc77sm2143831edb.51.2023.11.12.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 03:00:37 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] ufs-utils: upgrade 3.12.3 -> 4.13.5
Date: Sun, 12 Nov 2023 14:00:26 +0300
Message-Id: <20231112110026.139849-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 11:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106584

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ufs-utils/{ufs-utils_3.12.3.bb => ufs-utils_4.13.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_3.12.3.bb => ufs-utils_4.13.5.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
index 86709145e..7126684e6 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_3.12.3.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "faf0fe153547f5d02315fa82159f925f0c9daef8"
+SRCREV = "18c0a8454ca1cf8969170049f8c628d88627beec"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
           "
-- 
2.25.1


