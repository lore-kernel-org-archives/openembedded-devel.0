Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DCCC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 20:21:27 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web09.2671.1665433279677152459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 13:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gqkqvu8O;
 spf=pass (domain: gmail.com, ip: 209.85.167.177,
 mailfrom: festevam@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id m81so13862117oia.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWjb/QeSQZaUWFWHcJasq11PZWPxHkVTFW3dq3hV+HI=;
        b=gqkqvu8OUF9A8M0Jz63Q1lD/2eRK3As9RXHFYs1Z5UOTEQBal55XcLX3XD4lkiVAqO
         SD4BlCxyr4yZp+ti6kcjSzK5Fme7Njk+i9w3M39o5zSRrtjtIwo2fib4gne/qEnLIPwd
         Tr3iusK9vG4HODAvN1+Hw7h7Zm1XTVezlomaOrLZanixPTwbSbv3K2wRYzaR1UG+jqYQ
         FcalPkkvY8Qy2Wn3ZmfddT5PO1uAUUU20qbOzACzhidobjoQ/yNfoCaxhtfXRCtEgHUs
         KgDI8jjDjlQXhgwPlyvBAMVmyBOUIhAFZs0NjlUqUjekuco/vBlSc/+NdACQimUB6LFX
         VLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWjb/QeSQZaUWFWHcJasq11PZWPxHkVTFW3dq3hV+HI=;
        b=pU8JWPrBpN4TVU43Eyg/PIRROVqkNUPhJP8n1Rkhg4O6x5Mbfyq8ZWOineJMrAx1ib
         q8lYgOGrXbivfwsx5LDc3QaFTOKfrj6XGRLCzy+PmGd5xXrUgfw8msUGEk9dBeOJuJLk
         xn8gwboOLuiOdeGrdrYu+1/S7ylSCzoX1vwkme0PX6rVDvYFcdjossucAcyKsU2k4icf
         EH7FMeWDgSLCmS6UOoSCgJnP+wDT0wmlwvdwZztB45soG6iWNc0ZtssFxaHRt25Cyq3q
         pRIa9q0sHuDdPtgVq/p+yiPBT8yESGeEHnn5zt4KhPPpCmMkF0Wad1EjQhpfjS/pwsg/
         9d0g==
X-Gm-Message-State: ACrzQf1+lkDRQZzpikjEiioBb1BVt0r6szQrouzQfD33ZAy6T4OtwBAU
	i0/Db215zbpxwSupPKXCmMvEHl6nvUU=
X-Google-Smtp-Source: 
 AMsMyM52jxFOhG3c22PlLjVLAFJoAS1xs9x/8uVsf03fY3YnI2wLsuYedT/HgMqb44yoKQ7rtDaD+g==
X-Received: by 2002:a05:6808:188a:b0:351:75c9:e4a8 with SMTP id
 bi10-20020a056808188a00b0035175c9e4a8mr9528819oib.246.1665433278492;
        Mon, 10 Oct 2022 13:21:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:3cd6:908a:6ce1:5bc8])
        by smtp.gmail.com with ESMTPSA id
 e19-20020a544f13000000b00344a22e71a9sm4655226oiy.9.2022.10.10.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 13:21:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [meta-networking][PATCH] spice: Include aarch64 to COMPATIBLE_HOST
Date: Mon, 10 Oct 2022 17:21:05 -0300
Message-Id: <20221010202105.2471515-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 20:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99135

From: Fabio Estevam <festevam@denx.de>

Allow spice to be built on ARM64 as well, so add aarch64
entry to COMPATIBLE_HOST.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 1887a5582fa0..b3e687476b0d 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -58,7 +58,7 @@ PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus,"
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
-COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|aarch64).*-linux'
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


