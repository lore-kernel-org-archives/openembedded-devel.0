Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E97C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69128.1782634321091970753
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KelQBhUj;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30eac9abd79so818859eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634320; x=1783239120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnTYRGboeELpS3/oABZQBdf5Hh6ZNYljhwSPZ9094ag=;
        b=KelQBhUjZIawowaac/TXLPeGkuT9XhYB0UcYkPh6m/NSjiG1qoIPcOgyNfCFVS52S1
         zmjqJ6nuDczEzsEZSJyGWRFAwI2jFdkEyVYQrWrQNrXvubjKtoDW4SpC8JEjw3JaY8DU
         AiCfcsLMp75hbc42g3RM+M/ahh/1PNm/uWcaa3IiXX/YP2OyNQEIZTanK7T+2TTe8AlU
         yjhwDj1A50MNHW3Sn8bIN8zoQhU4Yw/SCSQm9I4qPu0mLZ513Uv9GkUrfbKSfYBapMCp
         Hk5ez2kuC4EPUtwbD0cwL68I2enxLaissOiQ+Bz/d8t+rtv9rTfjhSroXBb86T9QvqFD
         3AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634320; x=1783239120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gnTYRGboeELpS3/oABZQBdf5Hh6ZNYljhwSPZ9094ag=;
        b=OAboWuUYiEJ4MGgt2CdGtJuZV74zEnCjkeNWuoZhRPS1fjTp4+K9ZsP67bBIn6aiip
         tliOh29Fah72yKFb+T22OXP1Wi7Ldm7E52wo19IJytKzU7HP6KwP6OoK0RXO1wIBhcil
         ypvrNVUl0wh0xzrX3u0UjRbzPWzL5vJK5oCw77/KIUjLv3QK5xedB5Y/KHPKIxwWBOJB
         8ijlHRvyLtK9OpZdsfTcrYnm95ZhmgIKAPpBHKoWum9TR+y5AT7zHF0q5TsGlcT3v0qL
         Ehdd4TGX6qAH4ovtEHZh7TxjNVqQ0j83C/QIr04MOfsV2ZdTazQxf/xvr/XiAytIFQpn
         wzmw==
X-Gm-Message-State: AOJu0YztBrYT/uX339Rfl/UFaoqIXiC7ANwiMxZZJ0s/Z1X8UFiIOnUF
	UyjDvNuUKfLAkh6x7iRCgcwDi5K4Lq+SySwIH1X4gaQ021b/GYd0rqUq1PimU2ke48HYTw==
X-Gm-Gg: AfdE7ckEKG+Xj4DetcHqpsNC3mttWtpkpx02BznOQ2YwoNccX3izi6W1FZquVM9rdwL
	DCIPWSPC75nEFcdOUUSsgP651PnbNDZmMElaTlOAqmwq+hwtC7d8mkh6kB1cQUg9V5MFLgvwQ+k
	lmwmtwpmSVfJELnTHnXImGRFKFTesZ+bUiDLYIds8xDsQtwbHn3m6h33aJMfBv2TL5ivY+234AR
	CoAAFeL1oBieiIQsQtrLgMdMW0IptfGSWNdL/Fw3snNgX+L0xRxvoUcnBEcZNEulQEuou9iRScC
	vtxs/ChsnDhGvIY7O4VHLfJEgqcmIAGVPGEeI5Mm26PzZirTPuaHQiiMGbhdZQVsZ3/XTaPE1t1
	7+0Blojp6YbiaX180d4JmeTMCGWu7hRe2kXLviw0+qK9OlF4U6aXEfrA+3HDuceazHvsp2bTrwq
	uR2IsGO0W/YNs4IIt/FGh9f1zQZhyafFuOy/nP0lDgDcfL9aNHXyfa70RxEVndQzeh71nXg5z46
	vEx1EDgy0lL2hLfynUi5v6LYtrbR/rEmADDyE1AnW26k49O3wGkhw7MAYaUcsAioglWTZi6OpGn
	xT4VcwBrASGZORB7AuMJeWLwbQT7tg==
X-Received: by 2002:a05:7300:2215:b0:30c:1865:d9e0 with SMTP id 5a478bee46e88-30cab22b861mr6367568eec.16.1782634320395;
        Sun, 28 Jun 2026 01:12:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 038/128] poke: upgrade 4.2 -> 4.3
Date: Sun, 28 Jun 2026 01:09:49 -0700
Message-ID: <20260628081122.178348-38-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127848

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/poke/{poke_4.2.bb => poke_4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/poke/{poke_4.2.bb => poke_4.3.bb} (92%)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.2.bb b/meta-oe/recipes-devtools/poke/poke_4.3.bb
similarity index 92%
rename from meta-oe/recipes-devtools/poke/poke_4.2.bb
rename to meta-oe/recipes-devtools/poke/poke_4.3.bb
index 0ae392947e..85b3c9b08d 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.2.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
 
 DEPENDS = "flex-native bison-native bdwgc readline"
 
-SRC_URI[sha256sum] = "8aaf36e61e367a53140ea40e2559e9ec512e779c42bee34e7ac24b34ba119bde"
+SRC_URI[sha256sum] = "a84cb9175d50d45a411f2481fd0662b83cb32ce517316b889cfb570819579373"
 
 inherit autotools gettext pkgconfig
 

