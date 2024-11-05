Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EFCD2C115
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.19626.1730817425945808603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNt/D8dt;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e3e4f65dso8396817b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817425; x=1731422225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoFIF/ttJGWr8zsp1cGvjy5PlXOq1D8/dK+a2qdKuI4=;
        b=mNt/D8dtZLVLmX3JMlSzU/ZcBxrgzRLWBC1rIN0H7gJaUSaneSFRl051tgPO7nNzUq
         Hy/TSk7kskNelVIgTlYHeIFsTEieAAsGbz+RTWOV+Pz6jHDc5kZNJk0hpMnImDH6X/uq
         Hj/AAxAPsQscTWLYZYj7BBgQ0E35tqKxd/UJuKCuKIGrmggpeI0Gtk0YKco2/LBwSQHq
         bnL+WTEoTLTlDWAl9srXcUVbbjwW7/2BLXnt8nKRtM04W6tKBRRPyCxFczcvblIVJ78E
         PexMTxPkOfzysjeThVJZ2Si9BNb0wXEIeGjGOHRi/Ov4bKpDaa3g9DW3oPFfm/MbYCxV
         AQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817425; x=1731422225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoFIF/ttJGWr8zsp1cGvjy5PlXOq1D8/dK+a2qdKuI4=;
        b=Yhr932ZH8feyWP9PuMyBUcyQ4F04qARb/45NfNhfIVaOoIoNzPKuXtYU4zNYqClD1r
         70ENe/7UMmc14M0XA8/tSbah1VGyVbu+lo0xKRSFFug/eKcVSH+xQ5amjwOnhY27VSgq
         ICG9KGUS3OlulqOpZWUX4Kf/W/ZqB5jAX2nyTrVTKlctEXP6yRXjWVV2MGdK6y6LSh58
         k40mnc8QTOHF4kRCtZiaLoMkyDnjn5d7hG6KEbMnlBrZbIX1k9kqzcKeUUx3FIFiuqle
         XZXCTv1dENySBI+VfG7bJaEZ9Qkx4MJ1ilL5oCdzb8r1bFcSo0nx413O3uDhZeJSJvEY
         0xKg==
X-Gm-Message-State: AOJu0YzWnS0bO1UV620Mm28kx+iExYR8IZCs93c6OYoi6sSDtPL9tMMk
	62fmvyhgbqZpSuYg4f3AprLKhqUoowc+v4TCDQxUHjaBetFem8Lh7nBgMw==
X-Google-Smtp-Source: AGHT+IH2hWcFadb5yTR4SydgmDAZrxGYTtZS75UQjmuGOaDzBBMfswQMznNmPtIyL6iH5/QCpzMHsg==
X-Received: by 2002:a05:690c:6186:b0:6ea:96bf:1706 with SMTP id 00721157ae682-6ea96bf2f0fmr67288847b3.0.1730817424903;
        Tue, 05 Nov 2024 06:37:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 56/90] xfce4-panel: upgrade 4.18.3 -> 4.18.4
Date: Tue,  5 Nov 2024 09:35:21 -0500
Message-ID: <20241105143638.2301245-57-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113474

From: "J. S." <schonm@gmail.com>

Changelog found at https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.18.4

- icons: Scale at size 16x16 to 128x128 (Fixes #385)
- icons: Fix centering of org.xfce.panel
- icons: Rename org.xfce.panel.statustray to org.xfce.panel.systray
- Fix memory leaks around gtk_get_current_event()
- tasklist: Fix use-after-free on tasklist child
- systray: Update icon also on status change
- Translation Updates:
  Catalan, Estonian, French, Greek, Italian, Korean, Occitan (post
  1500), Russian, Slovenian, Turkish, Ukrainian

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xfce4-panel_4.18.3.bb => xfce4-panel_4.18.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.3.bb => xfce4-panel_4.18.4.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
index 7e70754431..c9fb654776 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] = "4ae0b8615c9811194bbda0172a63567ed7fdb5519ea48f7a4637f4e6e5365e1b"
+SRC_URI[sha256sum] = "32304f82094ea3779741f968dc851032d8790eb78f3aa01676520b96cfacfb54"
 
 EXTRA_OECONF += "--disable-vala"
 
-- 
2.43.0


