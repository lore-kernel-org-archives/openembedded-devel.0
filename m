Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984A7C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:10:59 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.63452.1699042250058372726
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JoHtv90n;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: festevam@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d9fdc712b8fso597971276.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699042249; x=1699647049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7evKIfBspp8N7EMTfBaDLcfJVTAJNArAvKisHXgkwYU=;
        b=JoHtv90ntArkESmKv84XHVuxIeYNTeyotbkP9D4w4ugcgkDkXOPMqekxhFRPB2YSiV
         hsrIU/ppBDRb9aIyc13X3Mgnte2yas4/6X768cB/Rl9XPmuy3pmy4ZuNEWvWM3PdEK91
         PhsQQ1QeZ0urr0gttdj5TkWI41NnWf5hi71Yw0+PPJbnsEKd3aPhzcFQwFUDtbru4YFF
         dDQExh7tHwdz3vu3AVSzUsSzHXd+zmEhhDXd2DgDLHq3WiJ0vG8aR6Bc/96EZWs/01yL
         0J+kMPeylC5Ymn2MCzjEeOxELOkGQM/DBscB3n7vFiiQUO9h5kwaHN0MZ6anV2P3RT0g
         PaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699042249; x=1699647049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7evKIfBspp8N7EMTfBaDLcfJVTAJNArAvKisHXgkwYU=;
        b=gqbTCWdoATnftRErAJ/oQ2VutiSAwSboe3P4MtEEXFgW80CbU+jR2yZgS4D6/IVq59
         3Zl7J+gLFih65/dqrdtQbPYGp2X+CVKJTDi8BdOCW3f6VWQYkxQcql2yeJ7psfx50psN
         T/eI4lFpZ8ShyxB1Dim587rGDAlyilh1nBY214CkhGST18S515C5am9OqY/t4OmKUpn7
         cPNgyIt+us1fJFGYeFn7ap82pUeqWSoHAQFamHJvqfDXK+Tlsfm7Mw7JikoW/E6A0hQ0
         i5VJr8By71qGqsagGe2qPnYk8jwQCmN/OSvOIKnszNwryl9yXmcuGJDKIeJwDXfJ27Bz
         QWrA==
X-Gm-Message-State: AOJu0Yzsdzh3i5niGPZsfcILM2PJ00Rpl2u1QsGUWWztWTBPusjyHq+N
	nCz/LQ8g274EWPnszYj/ox4Lu5bCz0g=
X-Google-Smtp-Source: AGHT+IE++TZqXSn4tUg9HnZUb5Jr+zTpouzKLgPqVwbjsyf0bWAMv1WM6yx3yN4NsmrUluqlRj/2Tw==
X-Received: by 2002:a25:34c8:0:b0:da3:fc3f:c84f with SMTP id b191-20020a2534c8000000b00da3fc3fc84fmr4087513yba.3.1699042248553;
        Fri, 03 Nov 2023 13:10:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fe70:4f05:3ab8:f73c])
        by smtp.gmail.com with ESMTPSA id a18-20020a25ae12000000b00d9cd730e4d0sm1213389ybj.26.2023.11.03.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:10:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] openocd: Use https for github
Date: Fri,  3 Nov 2023 17:10:33 -0300
Message-Id: <20231103201035.14120-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106087

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index d30d9c346..19ef98738 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "libusb1"
 SRC_URI = " \
     git://repo.or.cz/openocd.git;protocol=http;name=openocd;branch=master \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl;branch=master \
-    git://github.com/msteveb/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl;branch=master \
+    git://github.com/msteveb/jimtcl.git;protocol=https;destsuffix=git/jimtcl;name=jimtcl;branch=master \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink;branch=master \
 "
 
-- 
2.34.1


