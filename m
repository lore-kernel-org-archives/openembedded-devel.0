Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEB0CAC59A
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:47:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7072.1758700027305650476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RujqTs1U;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b2e0513433bso414949366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700026; x=1759304826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HWorNE+UC8boPjsNic2WvfF0bSVAZ0375s8Rx5pdff8=;
        b=RujqTs1UULZ0AeTKeW19iUO4jLR3wtlqzqMtmQB0QFu3eTfoot7H7J4gAwv22Uam5L
         4VOKa8cZP26T+CTOzMbPeQ59P3Ur3qAIyDaaQGDl4FLwRvFZObZOpIwbVioVSZBmhDK5
         MdHOhKNwL5haV9ThuEvqEHfPPgDJgjs4tZ4gezDqHIkrpHNPH3HPZIsoln+zTx+KmrRp
         p4vHRDQ1flX1A/Uf+a8GJhN/tyjwLIGLj6DDwuxcefpOHGoKw5e/N1p7l19cwB3af+7p
         ymKLFEdP+Q5YkW6PPt9dqcFMG7KLSlfxohfCgE4vCuk4Vs6UiUcLHRuu+ne1Yf3UF8SW
         DZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700026; x=1759304826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWorNE+UC8boPjsNic2WvfF0bSVAZ0375s8Rx5pdff8=;
        b=RtjzMvldVlL20DeRuaZc6d49ZEkZg0Gt9oEouG/N6T8MuKP9GOwCqrvvZg4D19EBtE
         T+H9UR9QoXwLdc+ER7nU/DcZRzVVLvryGifSDQuMmr2ygUCH5fXyXCX36ooGbKAv2NQm
         lmMzGyh/v5MowYyLQf/yXzO2JddlC01ksWyizQ3vzdhpWb/0tzhHMY59U6DvrSl8Ibv1
         WQdzpx5YPE7J08DCUensZa8gda17X0c1QB3cDYaPvpMB8hE/l120nCZAUDtaA2G8LHls
         tGxRedktY6npX2kSidEHZyJO+3EGXZ5jZTulhim1F/QGhiu/+aehrxvrkdMFI6vS5ILG
         u5Yg==
X-Gm-Message-State: AOJu0YzDS405hGLLI+xNERwBc82juRRR10DPBKWAB20YJu4lRAISelkp
	TcbhkD9Ntfut/kmi8d2JWsHJdvyosigrCJW6iGYyRG46/H8rKVPEQHiLf1QMhNiX
X-Gm-Gg: ASbGncsVAPHS5FX7lY0hBzbRBwr2Q75SIMb2U6nGgQERMPGr6k0tNp7DX2hoYQq274L
	UzqBLyxRw/Eig0AdDl0Ax+xkNG19IcCswY+bqp76hpmSr65tix1iRLF5DwgJHofvBNN3lDWIqxf
	V53xJSonYLRYamhNlLyplFIgkrif8WY/5xci0S/m4afUByE0JoL089qHtLSaEV3yKX1boiWxypJ
	4jA5dVw8l90cCDuauXgMSokwiMadhpu/CyKe+ozNTaRxBAr9O8hDfx7Aop8edU6S8oOvSzjj4g3
	zPgX5/1RsARxjyJj75dRKGra2P4FBO9+xWnoOs8Aweocrv1rb5ck/gHwZicqI0UQB2XGve28rE2
	xgH10+w6FrJAn9rR+jHJn
X-Google-Smtp-Source: AGHT+IFY0U8Zy+srLj80nsnaogOB4XTRpCof0vDUTDbFQkkDNOy7uYeuCWNDRZPQvnzN16lqbGnEbg==
X-Received: by 2002:a17:906:2744:b0:b1f:ecda:b79f with SMTP id a640c23a62f3a-b302b5104demr452896466b.38.1758700025513;
        Wed, 24 Sep 2025 00:47:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2eca89e388sm431496966b.106.2025.09.24.00.47.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:47:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] fdk-aac: upgrade 2.0.2 -> 2.0.3
Date: Wed, 24 Sep 2025 09:47:04 +0200
Message-ID: <20250924074704.3753440-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119754

Changelog:
 - Minor upstream updates
 - Fixed one case of a failed assert in SBR encoding
 - Added build support for s390x

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fdk-aac/{fdk-aac_2.0.2.bb => fdk-aac_2.0.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/fdk-aac/{fdk-aac_2.0.2.bb => fdk-aac_2.0.3.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
rename to meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
index 97196bbcf2..0fb9d16a9b 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.3.bb
@@ -11,8 +11,8 @@ LICENSE = "Fraunhofer_FDK_AAC_Codec_Library_for_Android"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
 
-SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=https;branch=master"
-SRCREV = "801f67f671929311e0c9952c5f92d6e147c7b003"
+SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "716f4394641d53f0d79c9ddac3fa93b03a49f278"
 
 
 SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"

