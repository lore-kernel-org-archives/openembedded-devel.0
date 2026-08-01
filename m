Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDCEC55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5273.1785589914762251388
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BpR9Nu9B;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1670246b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589914; x=1786194714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOzi5T2PL+TY7g4Fx2bOSTvQRHrFV1oMeHkRKF8ot/I=;
        b=BpR9Nu9Bd1rKySgwmOSbI0N7D116G6wQOYES5brOXn+8fUZXFKEEYs6/kdNIzaCIl3
         wPEClhMyew3J/5dd76qeuQ+GU/prSVM44wqueqlfSsZMPvDafUZ93eHkzEjtd58jSYnn
         pvYyAgwPNAiMGgQJAUGfUwTuFoUL0uaPqlXnL4bebfARBkLHALmEbZIWPxamUsUA/3B6
         13GDSkS4hx4t++MYAi2St79f4W5gb0PgmW9bu+qDVmcb6PHn8ZTtZbuLs2cBnvHa+Oz5
         cEnLlTyL+R0WXldPvG5qVccPh8BX4i7ZR2rGkR5rt/lZ4KCuV6p26bLl7PJ4DVfgaVPN
         okyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589914; x=1786194714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOzi5T2PL+TY7g4Fx2bOSTvQRHrFV1oMeHkRKF8ot/I=;
        b=qasEc7X0jczE2pz+KmSxtTRzLK82jlSPFETyBWonKnBiQb9Oy4cLVhmdi2dpbwqXiU
         jX6pAKqX+FFDjNLrISaJGQCneuG4PThUnYxaV6BCWJS2sRL5Il38KIROdR/yGqGkq5Lb
         f4cpEmNvbee+ipwktiwRgAlQmev1LcgNn41tSVNtdDZg01v4yppEz1B3GDnu95g7uRuO
         rNjoh9DHTjuZzqRJc7/CDOpU/wCWwd6qrAZtv5tfWEFvMZZwl8E8fs+wa6tqDF+N5K89
         wgibnftxZ6TLqr2Ai4QPsL3dHopfkon5nmGBVEYSZ8eU0nFZPxYQTzpHzayGqPwumv73
         eITw==
X-Gm-Message-State: AOJu0YwEb3Ak/S9Wo1ralOX20jj1YT+qtvoMSia4E+e4uB+YVqPEZTy9
	QhTHAtO4iep8qgGm+EbLnE9vy5glAvuzaeHKmLAofXNmD7IlSL2wBTrjVQR9Xf3T
X-Gm-Gg: AR+sD12Kh99zec2xdpaqxPGAHe+19sVcQq+dHDSUmgf7feZq5UjsAyksGM8W7PRwN34
	y8Ig0HOIPyDQLKskCT6ZEQII78BMsKoP03DCRiOZLEYh467I3Y0DXuW+Zfi8zDMmhtFQO/NloSs
	fCoCVoda0eMXKB1+pCHripOPfOlH2AZBKIF3inL5eMC1hc6wAiAo/TLv0fDBGNzoTkKIwQOsbUr
	jmgFXRoo9DUDKjbRgIpzSlfBqPEes/nIgy2lXKH7vOxVdRCmGH+v9JFizba+Qa0NuquRwp2W7nT
	isj9ExohJrxXobQB2CTu7qVqqUXv1slpwDs/PMAgZdYEHivRy3NveQoqDS3F7p9JPSqcumpBMNh
	bAc1kdhrtqsKPjEfKtQw52kRruyOqlZ7yU+AwtPzSuJDRRyhJ7lyvSP9mZuJevi7i3CdmtMGcbw
	GgM0aD1D3QzfUL9mKIdaqHGMS3ExKKz1fCtAje+fL+6P/J1lFeZsc8sQafnADJ1L5YiRjWaV5tE
	NDcGrsIUYl4
X-Received: by 2002:a05:6a00:4b02:b0:84e:cd14:aeba with SMTP id d2e1a72fcca58-84ee48123a3mr2849228b3a.6.1785589914127;
        Sat, 01 Aug 2026 06:11:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:11:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 3/20] gnome-bluetooth: upgrade 47.1 -> 47.2
Date: Sun,  2 Aug 2026 01:11:21 +1200
Message-ID: <20260801131138.3299410-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128597

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/blob/47.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gnome-bluetooth_47.1.bb => gnome-bluetooth_47.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_47.1.bb => gnome-bluetooth_47.2.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.2.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.2.bb
index ae72e6a115..fc68e37df8 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.2.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "03e3e7403a15108ffc1496210a1da5c2961b2834a5c07eccc7a3f493195daba3"
+SRC_URI[archive.sha256sum] = "41f20e6d6176b72590af63552b232d83f2fffdd77ecfaa5eaf32c5a4a86fad64"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \

