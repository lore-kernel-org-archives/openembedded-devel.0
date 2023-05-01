Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995D9C77B7F
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.87293.1682921122136148592
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ffxeisNz;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b4bf2d74aso1468391b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921121; x=1685513121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOUBgIafks7m7GyNzTnJQhQRpch+e8qr13Vny2TFL8Y=;
        b=ffxeisNzQFaR3n6i57Q4KHS5X1mOgz4uikJkTxGQ5/qJgGijIQbm6w63+cME9HJtC0
         z5atVryfjxmU46NK07MU6uZsf2/S5HyMoBpzy/E0UkWWpUDxycLb0KcR+7kwW5yr2fpw
         xHlikM/D3kCY56PVWoP83ReEgLjctZ/cOky1M5hkuV3Nji0RAef070ro+8mW/H6n3naU
         ZbeXL3V0G8CLxj8WV23I5c70vSi8TTejcoaxpyWBSiafJnpGCKyy49fJlEDTSd4W0OsM
         euGExmwTljGHrvre1R5EBuirdKvAP9TmwPUcTg7Q4dFokP0fI9vXonbKmcFOHbSmDbra
         XXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921121; x=1685513121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOUBgIafks7m7GyNzTnJQhQRpch+e8qr13Vny2TFL8Y=;
        b=XP2DLRnAPPrBopOTk7wdEbxNr00/xsTBZ5jEfFmwHnXiiJM/15V0MBCkJ8nNR6kzOp
         QJcwu/EldmbclDzxH6qqy53VDsj3tWbU7gfRdPm5671y6nQXFT6yo/zHe6SE/kqZ5wMi
         4Z4CFB8VV8QZv0TEltLr5rACLLdWcjJUS+8tI0PFG2E5El42HgGGOEmCAt4n8hu/7AK6
         o3il6Hcvk695BdmonXhcT+VxusIhxDqF6FHu/8WkM84xyFoUgf5yp9nP9uu58eifZ5rH
         HDpuRsFU9QgK32frtp/cVPj3wLte4ZwV73SxIb5xw6DqVfEOKh1RUST5KTXhiESvsyEk
         FHkg==
X-Gm-Message-State: AC+VfDycHCgop7fZo790z7ArOaiFhwwjnlvVZkIlfyhDVKqNY9nMmFAZ
	1NMmVSj3vbrggHWbvAw2OR+/H1hZXTwpOg==
X-Google-Smtp-Source: ACHHUZ4P4Xd4D1KnviJAdd31LFw8PHttv97A2OfEmJeHflXusjb1MM1t9GoplGNUHmbRln9FjUwWwg==
X-Received: by 2002:a05:6a20:1448:b0:dc:4369:16a4 with SMTP id a8-20020a056a20144800b000dc436916a4mr16443878pzi.19.1682921121115;
        Sun, 30 Apr 2023 23:05:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/13] ttf-arphic-uming: Update to 0.2.20080216-2
Date: Sun, 30 Apr 2023 23:05:07 -0700
Message-Id: <20230501060518.3505068-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102231

Point to a valid URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ttf-fonts/ttf-arphic-uming_20080216.bb                 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 73c8eb41a1..3fc7f39e85 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -8,12 +8,11 @@ PR = "r6"
 
 FONT_PACKAGES = "${PN}"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
-S = "${WORKDIR}"
+SRC_URI = "https://deb.debian.org/debian/pool/main/f/fonts-arphic-uming/fonts-arphic-uming_0.2.${PV}.2.orig.tar.bz2"
+S = "${WORKDIR}/ttf-arphic-uming-0.2.20080216.2"
 
 require ttf.inc
 
 FILES:${PN} = "${datadir}"
 
-SRC_URI[md5sum] = "d219fcaf953f3eb1889399955a00379f"
-SRC_URI[sha256sum] = "8038a6db9e832456d5da5559aff8d15130243be1091bf24f3243503a6f1bda98"
+SRC_URI[sha256sum] = "e3c19e04ea7a565b4acff6f1e4248084d2e10752e305bf7dd6c76e80860dc1db"
-- 
2.40.1


