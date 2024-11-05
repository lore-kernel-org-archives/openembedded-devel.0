Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12F7D1CA3C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.19538.1730817416463344944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9FkLw3n;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2bdbdee559so4975480276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817415; x=1731422215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vju2eA0vgGWYDFa6DpAQ0Y11GiXJSmdw52srd4XZGqU=;
        b=X9FkLw3nlTvky1DdRA2l8faDSA+ir5j47dwQp9a7YNQyoCsGWBSZld2FSpHSIu4PYm
         quBvEEOPgsgiC/kLzAdZ8x/+WuOQlBs1LPMnJULxFMCWh1AJwj8zslhxM5coFmh3m6Jf
         xjOdYonQZqqCwbttzxbehI+JJlbeQk300LiBs36PMtFrnKJEIdGiXNpg7ZL+JCw9trRU
         DUOaGopTxfix0rMYc7yHCZnnnql15nj+d0Qy/A46pk3ndjr3lwum8cfyf0VUjRnA5yQV
         oSJ5p5/5y2MQMZVv1ZXZWO7VTDd2Q7yP0b4mHYzbzGVhxUEq35c9ZJprFIx0h3/dQjRc
         ZdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817415; x=1731422215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vju2eA0vgGWYDFa6DpAQ0Y11GiXJSmdw52srd4XZGqU=;
        b=LwLecofopKq79VeXb5kWmgT1jmAq3442On5pook728syBN0BoU7s7Y54AiuH2maD97
         Ah2tj1+3+0VyK0RjioRI6qq4Gs3PjfJCVlZFFIP2HV5iTs7ceYSGsHdN6KtTA+0j92x+
         jWZjEuIyINsjxSapI++fFQmZ+z2IvW2Dm7TNjKTCEY9IYKhRT+2AEDEOm2TMbq7HWCdz
         F8ny8mIiT2SUqPSkt5UJLVNKwsGJ5ydEiC6CtVzx9Eh2utdLYz9IFn7l5nQaVL30mvZI
         OYNJqRFtEa1TXm59cvMXbczYtOEB1dqug4qaQ1dGsbEKxUoVU5DX1+EzEWxJCq1PAlvL
         YLag==
X-Gm-Message-State: AOJu0YxEf6GF01MWddcy3AocIZPhzZOCDv/5w3AJYbgnFpRXOJholCA6
	bS3uYbCfU+cs94yemaRRnLJmfgVb42sxkuSOziebiOU8y/Cty/zmyJhqBw==
X-Google-Smtp-Source: AGHT+IHv9uM3zRTSy49LjGA7BEe8DmJ+ACsTuFB4SjmYyDnMPIqOJaiEcjjxdVffal3svGqk+8pe3Q==
X-Received: by 2002:a05:690c:7013:b0:6e3:34b9:961d with SMTP id 00721157ae682-6ea64c2ed0bmr158454137b3.38.1730817415518;
        Tue, 05 Nov 2024 06:36:55 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 36/90] gnome-desktop: update 44.0 -> 44.1
Date: Tue,  5 Nov 2024 09:35:01 -0500
Message-ID: <20241105143638.2301245-37-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113454

From: Markus Volk <f_l_k@t-online.de>

============
Version 44.1
============

- Fix compatibility with muslc (!158, Pablo Correa Gomez)
- Fix GNOME_DESKTOP_IS_THUMBNAIL_FACTORY (!160, Matthijs Velsink)
- Update default Indic input methods (!163, Parag Nemade)
- Use ibus-chewing as the default input source for zh_TW (!164, Kan-Ru Chen)
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gnome-desktop_44.0.bb => gnome-desktop_44.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb => gnome-desktop_44.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
index 19bae74ce2..63847fe3e5 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.1.bb
@@ -15,7 +15,7 @@ GIR_MESON_OPTION = ""
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch"
-SRC_URI[archive.sha256sum] = "42c773745d84ba14bc1cf1c4c6f4606148803a5cd337941c63964795f3c59d42"
+SRC_URI[archive.sha256sum] = "ae7ca55dc9e08914999741523a17d29ce223915626bd2462a120bf96f47a79ab"
 
 DEPENDS += " \
     fontconfig \
-- 
2.43.0


