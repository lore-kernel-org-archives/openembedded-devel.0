Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6109DC07545
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:34 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.1296.1699905865544203844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ck69Zn7t;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b6f4d8ddccso374645b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905864; x=1700510664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weBfKBMEN3WdEEteT/kWkLPlC4coZ5bW4b/moqBK9G0=;
        b=Ck69Zn7tV5kNO629yb6W0sokz/ZSHTnxMXW/2DVNy98nMy8tc7o2Mf0tz9kNT+PGo/
         mqz591XlKD8eYe8iaWndB72AAdsfOKK1zS/GbqtqAdF7ZXG0O5GLKTB+zGt4Hfaj0Rkz
         Uyx37BbRqYUu1n/xoTz6WT5cW2Y7HPcG0MUKalpxSGRN88TuuGswH58FMnBLDyKsLkZA
         +6Ktik1Ls7pe5+5ED6WCUl/l01SQOX/IFXCIHkTUbZA/ukHFYMCYJPm0G2HIsMleK7XJ
         vSz/5LwXKP9jPzfzCg+VP4p4+W48o6gcEdZCPoKB89czWOQijxHrUJ84m7SPJuyfaweQ
         DXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905864; x=1700510664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weBfKBMEN3WdEEteT/kWkLPlC4coZ5bW4b/moqBK9G0=;
        b=wtC9HpCcmVhChIRHHsygJKrfqKRqVUp1bYmVw8yP5hn72pNKPX4+uX+JIa6dT1mSqz
         b6CnU3P6N+Vl5q82Tt66IbcEqrN21EkflRBm10qfMpW+qg4WmR8K3eJzH/daLDSla9/K
         DMPSyPP4Z6SH6kE+zo73jvTR44pg0OK6sNP8iomvbrrngHf3xU93rHClQptEtctPwkgR
         nNfjsW9OnCWyGU9wb/K3vPJ/eF4o4svdJsPcjRtPgFaYws2D3lreaRaBDg0av2xKLITx
         DLvxyekKb9knbvY67rF8i7G0ngK7L71tf/hvaFMhvOdjz7EnBOXp1XrZi30J5QPE/ti5
         Y8bg==
X-Gm-Message-State: AOJu0Yz4350XGiCHNnj+gyrvrE7KSzT5ocRM4DFtkuq+066SmWS0wZ5o
	54VM7+Ws6mZc0BqekHUOBs1vCy8lZvf3Dw==
X-Google-Smtp-Source: AGHT+IFftwBmjeubEQaJ3BXf1MutLrIDky0Da/2E7vC2eyHmn9pGj8P5J4DHnCnl8GCgvsuUztcrcg==
X-Received: by 2002:a05:6808:aa7:b0:3b2:eab1:91c with SMTP id r7-20020a0568080aa700b003b2eab1091cmr6784986oij.29.1699905864706;
        Mon, 13 Nov 2023 12:04:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/6] gnome-console: Add missing dependency on gtk4-native
Date: Mon, 13 Nov 2023 12:04:15 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-2-a2b88b041141@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106676

gtk4-native provided gtk-update-icon-cache
fixes
| ../gnome-console-45.0/meson.build:137:6: ERROR: Program 'gtk-update-icon-cache' not found or not executable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
index 3282a6d5d3..748ea7b5a5 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
@@ -7,9 +7,9 @@ inherit gnomebase gsettings pkgconfig gtk-icon-cache
 
 DEPENDS = " \
     desktop-file-utils-native \
+    gtk4-native \
     glib-2.0 \
     gsettings-desktop-schemas \
-    gtk4 \
     hicolor-icon-theme \
     libadwaita \
     libgtop \

-- 
2.42.1

