Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C99EE0AF4
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3876.1770467010374486056
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOO22Hyx;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso31883375e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467009; x=1771071809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6Q4+TJFS4waTBHxpiFiDNJFZMLX0EbvoxDkZLyrLbk=;
        b=TOO22HyxURsnOp/Q3vBHyLmEtuoeu5DAmZEtpT4PZjwiDFGCJY8OzKraRnyz9GsoN2
         xbUXka46plpH4zLMlEQfnnziUuK6vJdq7NPKrqbZJWs5PJId6oQvtOWlYMcp1w9fb1Eu
         stqmfdWOLow1EPCIBOwYTQzEk+31Y4uMMZj1eYv0uQ+/hbqhmH3Y++8ZaGA1ApItazDm
         UyFlPeCMkCPs+hl2+1fcJ4Ky0Po+lNupnCLWpa5d0ylhVADW0d9Z/EI7Lhk2x+wAXhj0
         56KdzZiERltnxb09aL9HOfDC2WFhbIimRPQzSxITyLqeiBZAc/hS6317RMzBAuIQZiI8
         Z7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467009; x=1771071809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6Q4+TJFS4waTBHxpiFiDNJFZMLX0EbvoxDkZLyrLbk=;
        b=cju7EgduqVpZ3cmRoBNwdXuTka86/hiMS8+cNJ2G+VN9R0NW5YR4tz7zs5ltVMyBnR
         Cab5tUGc2O2YxIiARNYJhVjMGuMNmcS4CHl8fDv07K39YTl+yN9LoKWnUPDpQU7opppo
         UudGZupWcSF2oekOQfslfzY8qpwy4C72kSxxhlKSyRkl8gygo+unCK5L4ZFdzFZNQXjs
         Io9CXTcNjzvYZ2qrg+Ul9pAiKee1o07+Zi7beSGye8ITjmt5TkPWYLAXeUizCLvnt96/
         GjVJvf4h8OwpN7fBferBfG4kEw0rn9c0fVKNAfwGW2njwEOG/e+HFWT+ZQMY9dt95J+K
         77ZA==
X-Gm-Message-State: AOJu0YwHRDG7W/HR2AzfK2e2iiNeXCxQ54dHmT8PX6WLxEB/J+kD8acR
	/txbhYOnm2VUfxM0rSwsVmSjwFjn4JmbU6b65oK9BqDk5+yUVmjXfOLO5Km16Q==
X-Gm-Gg: AZuq6aKhA88NxgHEiKlvxN1CmTvoLEiq1GFp7nDFVHMC5CAq+DGhyC0IJ8LPGy1TBTw
	Jwnax8siYWInxMuxFzIJLf+rRbFzf9muJ6TTyNTaL5dxfQ/MgAIwNzmeHkmLvJ2dGHFB0cI9Okq
	JzM8ZHYFwuwFyQlbnDRrDuOKPBzwVBWphI2OahFEpFzQtYKro0sGmNKGXvJ9EtSo1O6/btoJlrs
	CDYSh50CH0mZA6QVW9jU7jgsHwciJK7pYVp3qBEW268H4jqJDRQ+dqxn+5pmMnWrvsd1qNBLOMh
	NrVqFauBzLEFsvQzzqZFFrJMboUa4vKrQxoMHqlMCCnsqZK1Kxc/4mmaOs8X5eFpwXQ8HPdHrlA
	ITDKD9j8Dknb8H2oysXWXPB9q9eKRkNuErvyJghIB/7yo97uCz3Gij7OFfZPPZGCbErWfUAjk00
	6qmOj6KQHb
X-Received: by 2002:a05:600c:4f81:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-483209d06a9mr82119915e9.36.1770467008469;
        Sat, 07 Feb 2026 04:23:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 01/12] gnome-desktop: upgrade 44.0 -> 44.4
Date: Sat,  7 Feb 2026 13:23:16 +0100
Message-ID: <20260207122327.664604-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124257

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

Version 44.1
- Fix compatibility with muslc
- Fix GNOME_DESKTOP_IS_THUMBNAIL_FACTORY
- Update default Indic input methods
- Use ibus-chewing as the default input source for zh_TW
- Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-desktop_44.0.bb => gnome-desktop_44.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.0.bb => gnome-desktop_44.4.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
index 19bae74ce2..4a991683a1 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.4.bb
@@ -15,7 +15,7 @@ GIR_MESON_OPTION = ""
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
             file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch"
-SRC_URI[archive.sha256sum] = "42c773745d84ba14bc1cf1c4c6f4606148803a5cd337941c63964795f3c59d42"
+SRC_URI[archive.sha256sum] = "1d8cb9c6a328eb689b0c1269cf53834cc84d851d7e71970cdabba82706b44984"
 
 DEPENDS += " \
     fontconfig \

