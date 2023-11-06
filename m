Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07239C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 03:13:57 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.46311.1699240431300276469
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 19:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F8BJob6+;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: festevam@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5b31ca2428bso4114627b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 19:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699240430; x=1699845230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTQ/UZXHouQI1Z5R8P4t2UrjHj8BBHGuwLJqaSuLeXo=;
        b=F8BJob6++ttX8kE3nFYbE8/SGTGkBwnVqJsme2VMWx2AGdQlmA9KPisQkrIlDMP60S
         t+YkSWRxPr9tBpphrBlgkrvRkjiN5Dn0IS6SNx700WXdvYGQPw0ZS/TQND78BTYvC8xS
         oisicv+95y/4Gy4OzVBQmx6GlEQwz+kY1vbXxUQYZd1/SrN5xhF8VgN5r4+UGV3yeT8Q
         0PQbbSeMMRSEFD7gPzv4umXnN3f3u3dUvlmon+dAi8PdY+gvy7+wFpQvryVTzsVILaEu
         3XA7uKWjRMzcj+baFPMHhnKSeZ2wrNsnyPLvfYzYRHA9i0+vGGDxdPCh9Xm7ANqo2I2G
         qH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699240430; x=1699845230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTQ/UZXHouQI1Z5R8P4t2UrjHj8BBHGuwLJqaSuLeXo=;
        b=S4BI+FBUQ+KJ1dZIlEFw2aoDMwZOVZjPc7OyDiso9HYUqlaCEJj4QrZQCwaea+aJqd
         EYD4oAS43ege9oPHaQIPgpf5a5MN/0kZb2f3eQV8xXIWuvlt2SZ05xJ4TKb5zNCazdi2
         uo5MSSarmAeGFEvB2JfFCA4VI17VSLIkT+82oNmjz6beHt+2yGWfNR7sm+UHUcv1+8Qf
         0IyzNTKFHHDC6GLnypJwLY+3fQp+9D8umeweshv15INvpmT+7mOCUIXtNRYakVBTcfH/
         y1j+/Z8AEUQyDGq+Tn+hJ3VWOH+lppT2BVIfCg8T3wQOrgKdXg/jiDrCRf0MxfCQtuFY
         20Mw==
X-Gm-Message-State: AOJu0YzQhreu5MmsnhPSsctbmsyMbZBEzPh1pYofBpqyLbF7x1CUijoU
	C/21XD09y3Ao9geYF6u3wnav3aQZhzE=
X-Google-Smtp-Source: AGHT+IHDs+8RntY4o2ggknMr0WApLOFyHWwPTtwbh+UAyKB+JSWuoBGSjzP3IvXmqfgJ3E3m1LwQNg==
X-Received: by 2002:a05:690c:2b0a:b0:5ad:4d0c:475a with SMTP id em10-20020a05690c2b0a00b005ad4d0c475amr17626296ywb.4.1699240429981;
        Sun, 05 Nov 2023 19:13:49 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8534:1594:3c83:6ff2])
        by smtp.gmail.com with ESMTPSA id i203-20020a0ddfd4000000b005af5ef0687fsm3825870ywe.6.2023.11.05.19.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 19:13:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] crucible: Upgrade to 2023.11.02
Date: Mon,  6 Nov 2023 00:13:13 -0300
Message-Id: <20231106031313.2347218-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 03:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106391

From: Fabio Estevam <festevam@denx.de>

Upgrade to 2023.11.02, which contanins the following
new commits:

fix MAC address fuse naming
Merge pull request #21 from Lionizers/master
fusemaps: Add support for second MAC address for i.MX7D
move to BSD style license
tidying
Merge pull request #18 from DAVEEmbeddedSystems/extend-imx8mp-uniqueid-to-128-bit
fusemaps: imx8mp: add UNIQUE_ID upper 64 bit

The license has changed to BSD-3-Clause, so adjust it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../{crucible_2023.04.12.bb => crucible_2023.11.02.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/crucible/{crucible_2023.04.12.bb => crucible_2023.11.02.bb} (74%)

diff --git a/meta-oe/recipes-support/crucible/crucible_2023.04.12.bb b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
similarity index 74%
rename from meta-oe/recipes-support/crucible/crucible_2023.04.12.bb
rename to meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
index 4830acff1db0..339bb35f2dc7 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.04.12.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Utility that provides userspace support for reading and writing to the i.MX fuses"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a64ced9463b8c81d08335d41966e0592"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=201414b6610203caed355323b1ab3116"
 
 GO_IMPORT = "github.com/usbarmory/crucible"
 SRC_URI = "git://${GO_IMPORT}.git;protocol=https;branch=master"
@@ -9,7 +9,7 @@ GO_INSTALL = "\
     ${GO_IMPORT}/cmd/crucible \
     ${GO_IMPORT}/cmd/habtool \
 "
-SRCREV = "269c90b0067e469c20b11e7fc5f4681ad5f0af7e"
+SRCREV = "358b5e7adb7f101f870f2b42fe5371460a3cccb6"
 
 # Workaround for network access issue during compile step.
 # This needs to be fixed in the recipes buildsystem so that
-- 
2.34.1


