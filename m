Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752ACC4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:11:39 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.64313.1699042291561378707
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GVoQgEY9;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: festevam@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5afb6dda6a3so4870447b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699042290; x=1699647090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7evKIfBspp8N7EMTfBaDLcfJVTAJNArAvKisHXgkwYU=;
        b=GVoQgEY9j9T9mgtirL+vEYfQot/llkdyXD7g7cox1KywgbK4XsWKrDyDLq7yz+tnCK
         mGwRVkV3+zQkAZMvZjaEPw2uqMFwY7XaJx5fukM2qGnBc2Et3DUL4vECQ6IZ+uTOoGUL
         sKYf3lkcer5mh1pPKZvekuJFhf74u6D9UkoNwGHFtGzsrbliViHP9nUwWrsS+1Hou4pH
         ojqhpkv6QV5W9gQp8vZmiuB7Z7bstgd62v448prd87WU3MjSKeUi0u6+lR5p8YkEMP5N
         ctJ99fWVgBHezbDUscwwTP4owjoS9gUGjGZcl5O91fSR44US4XxKog7lq8liVQkYgQ1O
         Op4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699042290; x=1699647090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7evKIfBspp8N7EMTfBaDLcfJVTAJNArAvKisHXgkwYU=;
        b=TwvHDb2JwXP9nP2g9782+G0J9OtD6UzCeyI0GH1Fy9JAEfnELQSwAeN6SB1NT6UKem
         LPb5ZMrwn6xLGe8myB12PotJTtYqKp2Elbv1BOjpPzxFORwSiTRl2EXHfjsrMTYQhZUB
         OInCvSFL/WXd96M1zBb7nfUQx57SDkSY81HrKhx4wGWFcQdEl0WYWgOmEchAMt8zcb4N
         21rC4i5U+ydtH4hJLDvEQ6U00DpRPMCiY3wy6TZLdmV0NavLUs+Dk6HTtB6UnhMjw00t
         k5YmKkzjfnhbtuGr6u9Qqak2kfCBT9pvhdpm+fQWSWWJekLEdxvrAEHCmA2M98R3PaEl
         jqgw==
X-Gm-Message-State: AOJu0Yw1pZ+cRkpezd/tz0kDXP+4/PBiXHcYdyyMI0g2jpvh8+AggWZQ
	nnHQBoAnKb+sxzvwQaiwjtl2Xq2tFMI=
X-Google-Smtp-Source: AGHT+IH2EoD4lZul9PlJkU+SOqDm4MbFm1QrE648Y8QR27vox7ziUBqrEfqZ6mFmnOqLMn+AtQYS4Q==
X-Received: by 2002:a05:690c:2f86:b0:5b3:2e6a:ec63 with SMTP id ew6-20020a05690c2f8600b005b32e6aec63mr8446752ywb.1.1699042290403;
        Fri, 03 Nov 2023 13:11:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fe70:4f05:3ab8:f73c])
        by smtp.gmail.com with ESMTPSA id c124-20020a814e82000000b0059b50f126fbsm1339848ywb.114.2023.11.03.13.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:11:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] openocd: Use https for github
Date: Fri,  3 Nov 2023 17:11:22 -0300
Message-Id: <20231103201124.14216-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106090

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


