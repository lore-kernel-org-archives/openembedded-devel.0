Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E941DEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 03:33:00 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.10910.1689305575843094117
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jul 2023 20:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SGMvCgsP;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1119620a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 20:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305575; x=1691897575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ft+jQ/KUbxOr+GLbHmOA6KnqIP6qcFgpV2BBeh95cQ=;
        b=SGMvCgsPSW33xkBi4csu4UiGwkmmbRf/CeVXCmrYfmc2ikF9V1nufCpUAIKtGz22R6
         VuAkbMbRPcgAI6DlUfb64vbieBgZXWC83/4GpsfLmwVMPrq1Doo0p4f56lM6kMAicZrF
         aJGjqC4bAuoehSihEjCbE7nOCxiOLEM5ugAQ/0kEnuHg8HYjiZXam5zRVu5WW5HqGivg
         kVNZx+gJIFotW/4O91/HuKUaE7/UxJ5gxQ2Z/697eCgNVSwF5k4ttymKKuNlcLGs40AW
         2PidbuYosX7jGO8towNs6U2juD49Q/WlYRPWN6ZJgcb3caRKtt/9gsBIoiDKZlZhoZUS
         Uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305575; x=1691897575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ft+jQ/KUbxOr+GLbHmOA6KnqIP6qcFgpV2BBeh95cQ=;
        b=LlYAN9cHECf6JlF+En1Unog74O2385YQyOEuPadwMtrRxKF+PijOVnMND6yvbQteKR
         PSHOuqe+mZL+7d45kPI0XW7Fe0Snd/xJ0jm3A9WmzWUMiJens6m4pVVaspsZtL1nrwqc
         c0CxdJ0c0jWCoU5V9yR8nA+DRALDLYK1XligJtkUZ+3gYp6Um1OI+UTs/9ceLCgnUSVQ
         AdDpDY6uXtMWns2ysa14rT9/tdV11prisUwiT075VJvGba7i9iXS7r9MAS1cZTQOqiDl
         ROQfhYlKHIqrQpbnDEF75e9Lh9wj22aFiQRODb42QeOqZxAWfFx2mTvQFj80yT2GkqXQ
         yGcA==
X-Gm-Message-State: ABy/qLZqJQfSXymmu90kBS9NvaoWAu6d7jk2CMy4fQPKVnmJUjLtiG/u
	QUjsyzmkIGosNTALPg1Cm6FKf+FaSoQ=
X-Google-Smtp-Source: APBJJlGllKbOU2M8NpVk6NTbTEf0PDo3HZ0vd03/L9FA6D3hP0wvwuLp7zcUPjgT+LyQrd0gVAAQ4g==
X-Received: by 2002:a17:902:8c82:b0:1b2:1a79:147d with SMTP id t2-20020a1709028c8200b001b21a79147dmr3338473plo.2.1689305574664;
        Thu, 13 Jul 2023 20:32:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::e974])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001b9ff5aa2e7sm4276390plt.239.2023.07.13.20.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:32:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] emlog: Update to latest to fix build with 6.4 kernel
Date: Thu, 13 Jul 2023 20:32:50 -0700
Message-ID: <20230714033252.782768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 03:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103861

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 208b39acd4..0972aff32c 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
-SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
+SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
 
 S = "${WORKDIR}/git"
 
-- 
2.41.0


