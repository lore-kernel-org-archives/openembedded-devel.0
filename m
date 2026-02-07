Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7050EE0AE4
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:39:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4066.1770467976796887068
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIBVgmPN;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43590777e22so955471f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467975; x=1771072775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGG/5hFe9l1UuZ7F/Y/Ey7rK+aOOoZHlKqOBh2TGADk=;
        b=OIBVgmPNvaBLU5KeWHRF0yPCnduH/tNl+nYpVWAUyLWDGGNDpsF16HSIOfVK1xv3ga
         n0hcgzlvtoihSqre2H88yyHWItvI5EeQAaczcEuAmKPSGJlGBkgQ0cBsntmBIbnvU9lK
         rhWMmgf61GkXdG9iuZpm9kqTcsKUAt99CTAUWQ+1EdtTPeDKQrwIZqKszTjCCU9vSEUx
         6jQM584hB61So7NRhPeFIP/2iQ9YGyLMSlKYANqSKXdexluw7NNeFckIg1tFXJ9oXUZV
         SVaowROC2zLVLAkWb8xLo6ayI7b7OR4XyAq+LIBV2QhFnvFvG0Okh6RKLjsbHy/uYdJi
         otZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467975; x=1771072775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGG/5hFe9l1UuZ7F/Y/Ey7rK+aOOoZHlKqOBh2TGADk=;
        b=joGvQTiUcBtFL079tyuZjaXxxxRZ636pHtEGw95tu3olzJs/HHdOpZFlLyD3C5wuqt
         7jRySibZTdM0WTYOhMaG/Nyu2h67v7EQEoMjkAgm/qm39FgE4AMDTPGzPGPFT05Cf6bz
         +fj6+w00AE4RyHQG7UtPnI2SPeennUv5r6ni/L1tZaTruqyHiACoNPJI7c/K0Or2XBX/
         KbvlN1zVb9nNno6CsMl+dEBA81nOOVpW0r9odkXtmv08ZhJ+4nJL641fsgeVt9Yoawvu
         M5CudmXHmIGB7iB861iVRRVm9Mbdbl5GYg156UebnfiO/q7efRblx1J5uR72sjyDYew+
         aeAw==
X-Gm-Message-State: AOJu0YwiIwWIe+okuujy4PRh7AgZEuhRC7g/UVDD5gAWo2co/RrsSUJv
	ZYjboHjXs/j166NYOV2X5BI7QF93GKgnFuq8AXpzI4/LQH/pOqqXY+4WHB3VNg==
X-Gm-Gg: AZuq6aIqz8WsUtdouhi8Xt4I7sIDNQCDygaa3HovOtqvwg13QwrxGspTt2/SphneKY1
	sTLOa1UEDMOaGHIBVx6Qaotk68Wh8TL8Pj3nDfrBxgGmY9y1WZkezkPggO7GK4veOIalpmkZqJx
	qM4MnTFAAZuhfDQrfxzTodkmzXD11cpopcpA30wZBdzgDqFiAzZeh/OEmI2pDU9MsYkOyDY1Hji
	iWcYWupC0wPhe/bFBXP1PX6R+zX/4LHfGSCpSjyHp6xjAD6NO6NWACYHMucxb6Blg9sX1WO3e8f
	J3S/262QItErsSstsv9KeL/zXoT76SuikXbnj2Icz8AhdM0HypR+28TBnjxni5pb/F1K/Q3Rrus
	Wj2asp4jBQCS7L0M+l2E00SfcqM7XDDupFHl+bZDvt0+IvsnA+OXa7OJQzGuVnJuAAVn6RG+FXA
	AtBRiVS6aY
X-Received: by 2002:a05:6000:22c1:b0:436:9e6:e35c with SMTP id ffacd0b85a97d-43629349fbcmr7792457f8f.7.1770467974838;
        Sat, 07 Feb 2026 04:39:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362974b230sm13947845f8f.36.2026.02.07.04.39.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:39:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH] gnome-desktop: upgrade 44.1 -> 44.4
Date: Sat,  7 Feb 2026 13:39:33 +0100
Message-ID: <20260207123933.834447-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124270

Changes:
Version 44.4
- Support TryExec for thumbnailers
- Translation updates

Version 44.3
- Fix CI regression for release upload

Version 44.2
- Stop using ratio character for time in the wall-clock
- Fix variable initialization
- General CI cleanups
- Only parse XML files as slideshows
- Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-desktop_44.1.bb => gnome-desktop_44.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.1.bb => gnome-desktop_44.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
index 629fe929a1..2fe66b9e52 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
@@ -14,7 +14,7 @@ GIR_MESON_OPTION = ""
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch"
-SRC_URI[archive.sha256sum] = "ae7ca55dc9e08914999741523a17d29ce223915626bd2462a120bf96f47a79ab"
+SRC_URI[archive.sha256sum] = "1d8cb9c6a328eb689b0c1269cf53834cc84d851d7e71970cdabba82706b44984"
 
 DEPENDS += " \
     fontconfig \

