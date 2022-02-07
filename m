Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C85C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 17:17:13 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.1896.1644254232241658552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D/K3INIg;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id i30so14081968pfk.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjd5X41H66zKOpXVrv+Nu0Be6zkTqvookfP215rdBzo=;
        b=D/K3INIgfXCUjpI0se5i9TcX5w+mQd+bQo1GpNm5qphvLQoBf+SzddLlkf7LQ02URu
         EwewOPHV1JzoafJGUyq75OTUvbe/rBV5oHyRZAdm7UewQpKO3MO6ByA+n3ZH3RVgtYrF
         Mw2pOW7QHpnvMx8ikFd2eOVVYO+CKY5UJ82RqIm+gF13gxEyari9BQRCGvWdbsVhnqmi
         8EKbjemACmkLN8706q+as8yrOhpR5Q7dCQnvLkLPrZd59S5k+BnTcMvyUpgAOdTGHHIx
         Tuyhd1ORxJMyl3qQdSLRiCb5/wpeH8JJV79/2k+HaNJGsF0VyM+SAQO98XpXV7EnzSG/
         nT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjd5X41H66zKOpXVrv+Nu0Be6zkTqvookfP215rdBzo=;
        b=I0vmDzMusanezomKJUjQeyhRZPWPQ7dEPWmRvjbXDhFO+CVG7qk022LMkJ5bE5e/lU
         Qh89e3n3458nPoq0RqElv4r9La1UBcTuodjccK/jILhfGl0vtp2nF3Jy2hbi/r5v8E82
         dUHomMTKWm1lup3C5SriCpBkMEeHA+F5ONHPWFdj0tJqYEwqqjXIbyJ1V1Rk3dj56YZQ
         u86+9fevHK3YBcoNzwvuh2amZyts8FXnnbPPNWXuOUXMvTzSsd+bRmDKKgBo6GiSkMtx
         YEvsAEpwPFRPPhVjR/6w5fmZfvyyKHxrTBVBZYACY7KlxuwbBCDTPJJxD59BPKZ5KS+g
         LPtw==
X-Gm-Message-State: AOAM531DD+bBxmLjXxxfWpHkC49lwWXSDsm2Q1yuPBmn7FPpNaipVViW
	nGSf0hyb3pihTDpSq2QX4/tTAK72pvZU3Q==
X-Google-Smtp-Source: 
 ABdhPJyS6ruCHg8ruZme9dXj0H8fOBX9rMil+R9f6bGURC4VH7Qqq/8BGQVNZ4pxrp4V9H18NgO0gA==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr295156pge.551.1644254231316;
        Mon, 07 Feb 2022 09:17:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 b12sm12225670pfm.154.2022.02.07.09.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:17:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gpsd-machine-conf: Point to BSD-3-Clause template
Date: Mon,  7 Feb 2022 09:17:08 -0800
Message-Id: <20220207171708.1641455-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 17:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95243

BSD template has been removed from oe-core.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 8d74eb4a2c..9c1db3a6b0 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Machine specific gpsd config"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
-- 
2.35.1


