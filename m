Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07017C352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:26 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.22820.1669838481786086225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MwN+8GAi;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id cm20so2881251pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuI3BrXK+JUYjWMKgg7IWAf17+Rc0zn8v5MAKaA3/tw=;
        b=MwN+8GAiQ6ifBomDH8AZR7AYip2mKpJzkDybYbE4nUrwtSMTb1TpowrhQFReE52AkC
         eheSksp1IbU/6sQRKAUQWJVgjqV6VorgPg5CqFTU/xjFGaZ66HhK89nowbyjOklhjKrB
         fv1I2rGbkjsWgGEi+moun7qkrtLhw3nSXCJ6mUP9fymUwA4si+JRZIwjYK+77QJ9TABA
         N9vXKY0GvqOVgpJtHSBFZ440NwZzSsmG2moVSJWUUagg9XYTztna/4n5LLgdD0wQySlw
         hlThhXC3mtPp9odE5dfOQZhOK/pshk0zcPqvcCk4JOneEfTr3VMgUo95ifdiliNyxp6b
         LlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuI3BrXK+JUYjWMKgg7IWAf17+Rc0zn8v5MAKaA3/tw=;
        b=iAqQsQzxOhRsserAFfSDvMW7p3+2AiIG2HDrj2BDLehI1jdB1lzgh16fMjBf31JtKC
         IBBaLuV8WqWutY4LcKg86s9Ia0NRAEud+j93/9qE3j+hobBPEMK2ydPynFysoFYU5iWh
         YBqMJf1hwLaZl1atwoBg+JNBuyj5kedcQoZs7MX2VunZzEXAyI45dZLCogCq+f64l9hx
         287ilLVE9zW+VwVfXs1nAneKhh8FBcksLE+Y1qbLs/v9vxM7RAoPrqyiGoCDm8Kxf/bM
         nvVvSnb3xiKvbIZRCMKFQ0BM+gXGELqjhEm/OyFTOGIhk9Z/eosx1KQ7qhiLeXhzfhaz
         AOEA==
X-Gm-Message-State: ANoB5plemYKQLWtrKBzWL+4KW37AN5e5aFAKiZoBpYSXBXjxl/dg5PHW
	bCVvdcBKqLXNlywvcf3q8kqtNc54/oU=
X-Google-Smtp-Source: AA0mqf5lCLyjqJxKbbsdNiIoAuhO++SKnrP/XJW5YHz2Mso1M+aH9H3faPWPDso3bTCgoTilemu4Fg==
X-Received: by 2002:a17:902:d711:b0:188:c7b2:2dd with SMTP id w17-20020a170902d71100b00188c7b202ddmr45159518ply.88.1669838480962;
        Wed, 30 Nov 2022 12:01:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/7] gnome-calendar: Upgrade to 43.1
Date: Wed, 30 Nov 2022 12:01:13 -0800
Message-Id: <20221130200115.1954308-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130200115.1954308-1-raj.khem@gmail.com>
References: <20221130200115.1954308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99875

Can be built with soup3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gnome-calendar_42.0.bb => gnome-calendar_43.1.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_42.0.bb => gnome-calendar_43.1.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_43.1.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_43.1.bb
index 5498bb6ea9..06e06e9bd3 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_43.1.bb
@@ -9,11 +9,12 @@ DEPENDS = " \
     libical \
     gsettings-desktop-schemas \
     evolution-data-server \
-    libsoup-2.4 \
+    libsoup \
     libdazzle \
     libadwaita \
     libgweather4 \
     geoclue \
+    geocode-glib \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -22,7 +23,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-versi
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "b63f73f55032fc1390442f94cdf6b3cab9c91c774ddd2e5c61ecfec9d2c5e9aa"
+SRC_URI[archive.sha256sum] = "afa5fc66e2f691553cc7d517db2363cff2d62cd1b5df455e5f4f7133139d21f2"
 
 FILES:${PN} += " \
     ${datadir}/gnome-shell \
-- 
2.38.1


