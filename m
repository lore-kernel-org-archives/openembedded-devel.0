Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43F0D2B95A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.19642.1730817434832183391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hVZ+JiIo;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso5632981276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817434; x=1731422234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BbWkvumTKVu9KKpWO7BDRNsU3Xb8dw0qGZCNMVqueo=;
        b=hVZ+JiIoNwlI/lCtYfpjUozeIplgkHo/Wn1oSkGn8GZ89jpBfMofgJyraHsw9uF2hx
         FxgksNdmOZ6w1osuNXVXV0iaBcPgFc7FO3YTHgvk8AnFF4+8img6EoFUw2aX6baE6LJ/
         Iy5wqVUmds3FK7nDyvNrdCLniYWx/A97C0WDzXOOD7NmVP7vaNwh3+e3xEDwauPGmdBa
         93pR/TG8nyLVkzntBeLC86NDaIAfE3rwTOobQyyFAyydzMlgFjG5w4rVhEi0FUin0IEU
         HecigbwB2ZEEa2UiBX15xyubfwlLQ72RbSVP0c0ZXDXiloodz08e941Wl8EpB6QQBc2j
         ClHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817434; x=1731422234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BbWkvumTKVu9KKpWO7BDRNsU3Xb8dw0qGZCNMVqueo=;
        b=hYBRhMglPz4AdtRBd7/XD4VAWfaKbmMQDrDjFJ/zyTPVM8xGzMnmiDxRBhW6GkKBQD
         j4Ythy8z6sUXdqwzhEPdehGivPws/sP3LenHH6uZAh31653pef38CXG0KoFJkK5LBt8E
         7Y0ho0HT26BX+GEQZJaoPnADgMOQkarHn4WXXIvRc7fYpXubqMY6fU2TvUJeSrDi9VL0
         /DuSDLIV7Q9lOz7IeX/DkWv42cnIU5eKbSsy9vkypgWOn/SsYCwL0f3jA0FS+ytL4Vgj
         RVfKLCRel65Bdb9z3uo3xjRn1uBozt7W2aBVG3rTlQ7MW9lI0G3EJGrVwinvN9rzp4xT
         cVFg==
X-Gm-Message-State: AOJu0Yw6s+0llD2h12PJ1Z6CzknZxkv+3jtzhL4Kq3rla7tyPxVI22P9
	4unnT+2F8sO7W5q4IpFzhBKtFlPo4XjOrez1twQrcVDSHAKL+3KKQSC93g==
X-Google-Smtp-Source: AGHT+IFZPJgvHpd7HP5SMZdMalNIaMP2CAZo4KL5DP64/WDUHx0bydZUcEhoKCMfr8q7hfpS3IrSYA==
X-Received: by 2002:a05:690c:690c:b0:6e2:a129:1623 with SMTP id 00721157ae682-6ea64be680dmr167981407b3.38.1730817433853;
        Tue, 05 Nov 2024 06:37:13 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 74/90] xfce4-panel: upgrade 4.18.4 -> 4.18.5
Date: Tue,  5 Nov 2024 09:35:39 -0500
Message-ID: <20241105143638.2301245-75-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113492

From: "J. S." <schonm@gmail.com>

Change log found at https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.18.5

- pager: Do not adapt upper value of spin button in viewport mode
- pager: Update workspace layout also on window manager change
- pager: Fix aspect ratio for viewport (V2)
- actions: Fix memory leak
- pager: Delay GdkScreen signal handlers
- panel: Do not scale background image when UI scale > 1
- popup-command: Do not block autohide when popped up at pointer
- Fix memory leaks when using gtk_css_provider_new()
- panel: Clear item list before repopulating item dialog
- panel: Remove autosave timer for plugins
- wrapper: Really ensure we don't call gtk_main_quit() twice
- panel: Block autohide when the panel has input focus
- clock: Fix sync timeout for seconds display
- clock: Implement ConsoleKit sleep monitor
- Add/Sharpen icons at 48-128px
- Adjust 32px icon margins, new separator icon
- Sharpen icons at 16px and 32px
- Increase margins for 24px icons
- Make 24px icons sharper
- icons: Fix wrong exported sizes
- Translation Updates:
  Basque, Catalan, Danish, Estonian, French, Italian, Kazakh, Polish,
  Russian, Slovenian, Spanish

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 48d82c20c49a58069aea7c5b825f2f615b7ae966)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xfce4-panel_4.18.4.bb => xfce4-panel_4.18.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.4.bb => xfce4-panel_4.18.5.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
index c9fb654776..8e4e4966c4 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] = "32304f82094ea3779741f968dc851032d8790eb78f3aa01676520b96cfacfb54"
+SRC_URI[sha256sum] = "b20e0d10cc5149a601d8eee07373efb446ea3e179dd032ed8ddb5782e3f9e7cb"
 
 EXTRA_OECONF += "--disable-vala"
 
-- 
2.43.0


