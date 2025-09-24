Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A26CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:57 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.11195.1758716928324382502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bome4xDF;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso11457288a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716927; x=1759321727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I4zj7d1uVO7hoMWsqujjSl8Q4pTANMtVNfPXbM9oYo=;
        b=Bome4xDF8MUJfhZxzac409zqR/CF/2PpI73WQwDTZryVzCDPuyZasAZdGdUIXadeEi
         yUIzSBT2xwCm7cx8ZVbbup3jT3Rk7Xvefyuy9Ffth0Ovr6JbYf1anZi8qVHQISgpHbFq
         TtLcAPFgGPOWXusi5NHjWSzTLOe9xskXQDIa+tfiSFcvMK04ZAyLSRJr/tAhJ6YLx52d
         Q2wWTr/Ikg2Sr8QyTYAIAWTrLQx1Pxvea+hAjQilEmYYNkyskHjxixX2jTBVZ9DEtfFP
         RHd4Y/Bj1opVFxjZu/3u4lC29sXOIrWn2zSDYHPcQGUQdEisrte7zsyvs49AjXt/cag6
         VSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716927; x=1759321727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I4zj7d1uVO7hoMWsqujjSl8Q4pTANMtVNfPXbM9oYo=;
        b=u9QMgR29R0hWa6XDNQWX85A8g4b4MuQpJg27LaaaIU3oVZJ+b+elqg4R97SR9hmRVg
         ApaOaKTOPAMj6iExHH2gePiJBqeBPobbeIKJEtk6ay5Pkh3zpoW6tMU638GGnS72Ts+f
         ShdCHQBx0RnErAeSzIvUI09hC93OsXEQgG4r6KYh4kCA/thgwgm5NB+sttMPyMU3kWIg
         nXajaKazQzgTV8+GOt54JdC1OHxLB2oWMbkztBJdvO5P3iK1ow9KIWcO6dRUTVPLz7ix
         iNnVLxNbFuWNota72W58pUZk9XtVAAU6BzyiictVVjubBs7hoF2fr5AVcWrINV2IbxSX
         LeJg==
X-Gm-Message-State: AOJu0YzAnwVlFg8cqRAMVcrfMlPOQLYx7O1k+Wqg6e0jOlKT8PPirVZ2
	/YeB04VUjvLT4MPdHdYAO2tlUNJvctdfXaa5y4HX7jkYhLhiHQDP89buf1AUoA==
X-Gm-Gg: ASbGncvotFJXnnS5ySST5qkKOlRLnj7j2/OcrzS1f8JTmPsA/EGussTY/TNo6TWO+q3
	f7Z2thYaGEwgo/iL07kYypZ7j8g9KkVU/Er5i+uTe1dbXiYHDlGXNE3e/HbSw5uTDA88VhrbgSI
	4SH/iA/bCrK5HYzV5MzsKR4PmfBZBF0XhSiMSuRLNU1aaliuLMyz77o+I0bc5vg/jWKmUJCFWam
	LLqafTMaPSb4ElnqSANdl3RBztdcsMNSxKx0yBq3X+Ff/vz5+5Wk1FtYehPFBlHdsBj5zp5D5hq
	4ZMqZoXxmHkOoEm819B9uwXh9OmwUyEjtf1reQbYuiWpclXKUAvFuPtgOnvfcMZXfidAXOiu9Z+
	CWrDMQd+wl2GRvJTYIbcK
X-Google-Smtp-Source: AGHT+IGB753S2mQTRK4hVL0xhatDxBXq+0LV4aPGvb62A+gAEIrzSlIenN1AMARaRMqiNdcjvhlBTg==
X-Received: by 2002:a05:6402:358a:b0:62f:41d3:ece7 with SMTP id 4fb4d7f45d1cf-63467797243mr5716116a12.14.1758716926585;
        Wed, 24 Sep 2025 05:28:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 05/20] gnome-calendar: add opengl to REQUIRED_DISTRO_FEATURES
Date: Wed, 24 Sep 2025 14:28:23 +0200
Message-ID: <20250924122839.4184719-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119808

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'libadwaita' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb DEPENDS on or otherwise requires it)
  libadwaita was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-calendar', 'libadwaita']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5192a8bfc3418acdfde44c7e463bc0ce9151d96c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
index 7b32be611d..5498bb6ea9 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
@@ -20,7 +20,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "b63f73f55032fc1390442f94cdf6b3cab9c91c774ddd2e5c61ecfec9d2c5e9aa"
 

