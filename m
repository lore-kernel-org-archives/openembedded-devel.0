Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03296C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:06 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.2259.1639593053020997643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 10:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ni3QdX3X;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id q25so32992683oiw.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wQGomxkLbNUdkvCWvFRbR0r0sWI0fDqRcoSxCpUwuA=;
        b=Ni3QdX3X4VHObbuWBFxXIM0cHlnqPbwrXeJo58PRZfP+RFgXSyQOPyG4qaJb/N2aFi
         9PaAjkIl+HB4OhVw9s53v/6I5OhNICXpYhA+IGQjncwJlYk1ndVxEmJE5g3Myk500Wtm
         mAQPteobd8ljBDBUWZj9jC6uIDUUGU+mxOIFc9f3LW7QuyXlTwLYtw6nXmHouB+VaY2V
         Y9/5iSNYHxN2LQvpbUodgVB23/BBJI6vC+14mH3BctUXSsChM4V2fxXbCCpc3lYiI4+M
         wmoLy/XrSD7ISYdMAYCx0MCAlcBGvBpnHQxsW6fLnSZdYTILQnklfWYpFITsRBUAA1us
         aEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wQGomxkLbNUdkvCWvFRbR0r0sWI0fDqRcoSxCpUwuA=;
        b=79pkHEsBkU1Bjx4XCA3JkMVCyCBcmDNWNFM8XFm54P1sllf7d06F0VqMQNXgfC3ALI
         JvwKlxHvcFibhNqI58IJEEzI6+Id0w5tYKwMSf0MNoAAbcfMAlXu5zfyA78XFlYSya5M
         zhTxeKhLjSljlz/o/kLKSpgaRMCDFhEc2xLobDvESh+3+Vs1hEI/z7B5yPNjB02q+1ux
         wJB+XTrGzBwzu5EreeZ0aGu05pYGQC+ewWVYo21jox6c2mxKpUioBsewwSVc5m8ZqduH
         SPUqpbASfA7tmgbwh6OvDLlyNVHkZJCw3kCwKlaMoA1B9uuugtiDRXhggsXIO69UzKTg
         1qeQ==
X-Gm-Message-State: AOAM532seE9gQU0TGGv1OVsTVBo9STonYeDqyxaAiXwAHYWYRXamrlWF
	1TRk45Ak4wy8j+toV7Y0zgjpte36FmU=
X-Google-Smtp-Source: 
 ABdhPJx23lDJnkmiDSAOcCpTtIcekdQN8SCPseiMykVFCLheE9MeJBuAg9/1VfwEIoG0vBG3cj0zkQ==
X-Received: by 2002:a05:6808:1707:: with SMTP id
 bc7mr1060796oib.86.1639593052126;
        Wed, 15 Dec 2021 10:30:52 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 a16sm572697otj.79.2021.12.15.10.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 10:30:51 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] jemalloc: Fix license file
Date: Wed, 15 Dec 2021 12:30:49 -0600
Message-Id: <20211215183049.1939771-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94370

The license is contained in the COPYING file, not the README

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index 32fa8f5ff..17a04e11a 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -11,7 +11,7 @@ LICENSE = "BSD-2-Clause"
 
 SECTION = "libs"
 
-LIC_FILES_CHKSUM = "file://README;md5=6900e4a158982e4c4715bf16aa54fa10"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 
 SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https \
            file://0001-Makefile.in-make-sure-doc-generated-before-install.patch \
-- 
2.33.0


