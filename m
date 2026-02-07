Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F47FEE0AE8
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3909.1770467014500781663
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8gZaqax;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee0291921so14260365e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467013; x=1771071813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GedTFbbjB9r07ksfYFm0fVx86hlaeSaTiNwx38FROls=;
        b=G8gZaqaxeLqcV2ILAQ+whEvJVtca03OlxqQcj37dALilvDt9+mRLARKcELRCxHr6yb
         2XX4GkydPZRtyUXRf2xSkabwuUQ19ckk7RiSZSMLdKak3CJk+6gxMV37jF7qkRBpCANQ
         eNN+RB6SKI7Al8xgg8hV3bbNb22wOXh4SWtjtSsYb+pKQDLiANNgaEL3FUnKtB8+UigV
         8SZLJ25uUwoPMqsYAHOTkk2CcH2UaWMYBLk1OHaKowcdIYX1No5glXsI7DiySwJ1H1Wj
         H2NYXTU1rlhzIMwsL+EXJiMwbqxh0HC8yR6sVFJty2zOxEg+RRWVz60ZdlmcV6StGI4M
         OcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467013; x=1771071813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GedTFbbjB9r07ksfYFm0fVx86hlaeSaTiNwx38FROls=;
        b=P52dx+Wg6lg6sZuCoPCVA60fL5u1ri8ZseC5FiBvG/M8vHV4JsIMw0YjcgVX8TtIsB
         mSdHaQ5e3KLJWmGHY5gOaSnnxnW/6I1qRBxjR9UmpRw+M7/73oZAOffw+iLEsYoxXrRc
         ABmlNQIr35qO4rCEfq8OR3JgeD7Br174Yu2riyOayHchgJm18iDtLnjlkzRgGCwCXEyA
         w4wAZqB07BkRuq+vmWSUUMXyP7qF+HsMgRSgSeflvS2lx4CgfoYw9NIeGNSqMKjkGF2K
         +9ul65sUYsjl+6EEeG0wH5l6Mpd7th7FO6cfKqrQhdIJE5WJl4lAj5vH5gkpB1WxXLfT
         +dUA==
X-Gm-Message-State: AOJu0YxrqRpg4LMLzgCNPe26T3tYNSFBUVv7/p9vwJ5O4x1NYtsp7Nph
	MRZnlgudbVvf8c0Pncs0fEYLhLccOSYX7REkk2Tg2YIuvuV6led6Ye+XKjvfTw==
X-Gm-Gg: AZuq6aIzcP+d3KxTZqLxH25o01P/+avPTudvOkcrvIMAXWrSCjOcmy7EmJvopGbB6y+
	m/eVQ6tcrJFWcCcUoOFbE7PNSWoQ8/XY7aIeJAyG1DOXh9hSgmaz6Ykl2H/a55lRbfYA5pEgo0U
	p5C7DAvPBJy5AZ8mklFeU24VP1dnP2MDSByKyZDMDf1HxE8X1cfuatgRI1knPqB1oClnz4nsKqz
	NFj7bfg9qKCAemTwJ4yCDL7+IgAFQ3XTxB0nXFbyEhymuDaE/P8Q2Qm4Lw+qF3aS8ZW7dT2ZpEK
	AgDOI1/r4w0fxR1qiHRpTaOS7S+IaXoiM8++1c6TDpIi4Hd3jyloRnu2EMGS/Roa/EkUWQ6hTqT
	sG07Ic1CV1G22XS0wcu49kwdfzTotaH+7wl02CvF3Dn3/Hy3qXo4MboBuaZlvQCRBqOMgFIWpig
	/dBOtI9Uu+
X-Received: by 2002:a05:600c:1d01:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48320213a37mr84018185e9.22.1770467012757;
        Sat, 07 Feb 2026 04:23:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 07/12] tracker: upgrade 3.7.1 -> 3.7.2
Date: Sat,  7 Feb 2026 13:23:22 +0100
Message-ID: <20260207122327.664604-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124263

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3142a9ca94fca2ab8c36ac5f6b7fe435cfb9a5ef)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tracker/{tracker_3.7.1.bb => tracker_3.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.1.bb => tracker_3.7.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
index 1d5c79ab4d..f3c482b279 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion python3native
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] = "cd91b885ee9839cde5387f8e05ed24a7108d1627629cb6b1b2aa51a9603e130a"
+SRC_URI[archive.sha256sum] = "debcaa291e46afadc1cf6a251f17efb02440aa48bff643d78c61123807dce00f"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)

