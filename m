Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7EDC54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.68628.1674717462111039724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IT1qpEWy;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso977847pjf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyRhOwNWOxCkPTQxuw+t5II8UA62rV+r7SDsiHChBKg=;
        b=IT1qpEWyaEnrkaKiyGwa8BkoaaJ6+HbHevH2tbdGUZIaXtSqBsfxIhYczC3RGv39tA
         JFeAFVy0kImS9nGOq++KB9IgHJ7rLjqjZNt748yr3W5U3DnIVXx18k65xUxy3bKG/pk+
         dR1DlGG2R65o34n3nxRj+EMlJxaVwMaaker6TrL3hekdcf5mfxlHgNAhM6Rp0dk+yncp
         wctPEL7U4TL7qfMCeaafHcCzb6QWSHUJ85fTyZjsRKGLU6Xpa3nbNy2H91ihxTd1Y2Rr
         wyV8vdYt66tkNU4pgl1YM9XMnUaKh56X6eLOHoMhya31XhN/H/qI1mTw6oAuxp5cfB1F
         f2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyRhOwNWOxCkPTQxuw+t5II8UA62rV+r7SDsiHChBKg=;
        b=NVqUGAgKVdiAT3vHxU/wAK2syh1ri+LzsQeCmiLxvvWMGUdHMeHFpJNWd2LXgtG1aL
         5k621FGFMGb8M/my3sSadqZUrVjx7IDBK45lerii8L1EBpMIBUCueeJgAy7MyZUYfMps
         VI7M9bOPozi1DL+HERKHVXMtrzvn+K/LiVGMT7XBVtwuQXcKElwFLlbU8RUXkF6MELz9
         BmLkFOS8XHF2ipwr4Z+CwhZdIN2xS1Cf3IukKbLnnB1sPJ5YEA1xSNT/Rhy75wKhRNEF
         sRY572Puy+Pd5OFlKpFdhAwFMmipsEq9PHiXUl1ZlJyBWBPAzblgMLBu7gxRXZSTB5kb
         oWzQ==
X-Gm-Message-State: AFqh2kqh6uVfTzq/DIXWbf/C+aMDctRb+XLQtwOgfWsVACGq1jbQkM2W
	Ro9k70wkfAfqnhh3ubUMEDljoxr9d7CdMw==
X-Google-Smtp-Source: AMrXdXvyysNIYVLsFfcHpuZ1dyfedvdS+0NtmtejqNtq5EhLQcNViN/01YeH91prveUcYa3ZCuV0/A==
X-Received: by 2002:a17:902:b213:b0:194:5c63:3638 with SMTP id t19-20020a170902b21300b001945c633638mr32793959plr.61.1674717461208;
        Wed, 25 Jan 2023 23:17:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/13] redis-plus-plus: Upgrade to 1.3.7
Date: Wed, 25 Jan 2023 23:17:26 -0800
Message-Id: <20230126071735.2444745-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100786

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{redis-plus-plus_1.3.5.bb => redis-plus-plus_1.3.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.5.bb => redis-plus-plus_1.3.7.bb} (90%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.5.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
similarity index 90%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.5.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
index de19dca387..21783b30d5 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.5.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.7.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https"
-SRCREV = "58084931ed1a056d91fe96da7b9ea81fa023560a"
+SRCREV = "f3b19a8a1f609d1a1b79002802e5cf8c336dc262"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.1


