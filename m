Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3172EFB3D14
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48210.1774867180993853148
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MKXYIdG1;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d971fbcddso847237a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867180; x=1775471980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8rvRorAJg46yrqXhcXUEm6zzhP7Up5zLJuEhemYRoQ=;
        b=MKXYIdG1Arbrzd9A6JKrtAxxQz8dioi2b/ZBpAB+l+F6sFj5VPM9T3yIG8RONSQkZN
         lK9D1gsoiWQatb3uxY/ALWpv+tiC3PEEpRT4eyWGwelPGuM2FivCEqx95pR9DkUF2e7f
         KCbGZETXmLWVfVygw4BAEokSn8Op3k60wuQzfwdn4ILwbBhr6qtD1Mgqtopstkd1zFU9
         /I4h1qDoOcACFnbb3sOKnhvtfJaKqiZ3tHXAmx6xDs+JII3lzf5O830eLyxCQNAhYPEa
         +aBjBagPgm3nRZjBLFJIPRCxlJCfbAi1RgJwlCavaCynpbNzCoRaBBOQwYUaSJhjUkF9
         S7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867180; x=1775471980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8rvRorAJg46yrqXhcXUEm6zzhP7Up5zLJuEhemYRoQ=;
        b=rs8U4JTdaR7++PergCZ5K/R+FoqDHlu4kHp6FpdngTkWwgbz51LRknxCTVr6VBNWse
         Q56KggiuzmbsJMkDPB6eadyQC5adOW9Ciew+/KQeSBnmXCSojpCfKTMMF9dWP0cngxAI
         ZabXe46jQX4eCHOPJvMSxpuRl041Ue83zOGns19GMF6W4erC17VPt9DJKbf/mDsnzG5s
         0VZux//Cuaj/Wr+HB8cTH6GwtFDlSXcdCbJWLM3vmM4zGFOKYlRSgkqhUFUeeimCmj3U
         VLaRJHOGGIq3NnawE8qZVvapmV/sZhub3H6ZQfTL91dEwrUz2UoTWx4ObgFoFZBhd00D
         kwRQ==
X-Gm-Message-State: AOJu0YwKtstlyE3+pe3tnjlpBh270yfTIGnIpdDtBhHS910i0BCJu46Z
	CaFyuG4OiuOqtF8AExy+xg/zwApftFdOd1yqJAI6N54DpsSS+X+/GglCz7T8mw==
X-Gm-Gg: ATEYQzzAoZu90an2/KuZ1Eqmw7JIyLhuPtL/V3e19t/xQi3USnaZ4OXjWs7KFFefsOJ
	sRjPpWNOQh/dZTFQA0U+VHn8XF2gAH77FfbuejLAWULUOPxyjEvx0HFpoJ5SeTACo5QQ0QM9IiL
	yHnB7KPZ4oX4/5ZnBL0b395zGsV/z9cCQFaZzjzku23y34A7WjfNLjj3hXjFlOWbByftUa7bawV
	CmjIR8apcL4urnXZXY+a10nZ5F1cPkL3vMZv70Yo+qLQ4BrpFVU2gD3inYDRuY2waFXD07EgvbN
	AE11TCN/YPaKbBBNxqTKXBKR+KQK9ykdtmfSC7a3mo1wYuOjlNLtcqr5/tFqX+rA9JtabzmxytA
	aJcuEpa2arfa0MxJwkzxH9tJOGwbgHbHXI8yfiBR6f4OgIebcmNXl68Qh6e4dEQpmlfz9YDiP5Y
	Otp2gXTC2EhSb9eayECXCHC393kqFl09gDyFI=
X-Received: by 2002:a17:90a:c88f:b0:35b:9d0c:a2f3 with SMTP id 98e67ed59e1d1-35c30de1552mr8923260a91.15.1774867180232;
        Mon, 30 Mar 2026 03:39:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 14/19] nautilus: upgrade 49.3 -> 49.4
Date: Mon, 30 Mar 2026 23:38:41 +1300
Message-ID: <20260330103846.3381644-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125857

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7d09cfdb841411136ac81123aaf531cfc41a54e6)

Major Changes in 49.4
=====================
* Bugfixes:
- Fix crash with gone MTP devices (Adithya)
- Don't count children for autofs mountpoints (Ondrej Holy)
- Correctly check for invalid thumbnails (Khalid Abu Shawarib)
- Don't invalidate thumbnails on access (Khalid Abu Shawarib)
- Fix path for script run from Recent (Khalid Abu Shawarib)
- Fix icon cache (Khalid Abu Shawarib)
- Fix crash on trashing in bind mounts (Khalid Abu Shawarib)
- Fix dragged sidebar row margins  (Khalid Abu Shawarib)
- Fix handling of early rename popover closure (Alessandro Astone)

* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nautilus/{nautilus_49.3.bb => nautilus_49.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.3.bb => nautilus_49.4.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
index b6c13dedb0..9befe945df 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "aa6bf376f08992362805eae01890b1bf5ad148f356aa7ccfe1f664eda88d413e"
+SRC_URI[archive.sha256sum] = "1476d9459a63c85f0ebc18f237b32d12b008ad786002376424919725f50e76a8"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 

