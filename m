Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.2252.1585607193642412191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 15:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aZU0lLjy;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id 65so23644484wrl.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 15:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vlyhdbI9DWvWwlKQmhlNUM86Tk0clxCh8LXg0j4nBZY=;
        b=aZU0lLjytySngiAH0pkmzuOvhpyCGVk23VWQd93gfstrUBtytK4k079sP9B8qlovrY
         8yGM8VyNdqvJ1AAL8wl8zDHtfwf4424azIbQjYud7X6IFHpwYZWwxDf92mLmqikqv30x
         tKI+tUboFDPmzC8cyPMQ3tlNcrxNLnGw+3bM6lZ6VUqM7GF3DMIfpUensDxIb35ldePE
         mrPcwEbMp6Kf6mHJhS25HFUAL4GWDIj+/6MKJHbYH6ztPn+2/OFhhWXR1C1d58Mf2EOS
         Ew0V6oAue21d1D6tHwGDVRe1nr9P+rSgtPwhAFJHcyi1D2qP1engBqAw6LjJ4mHEIGK3
         5kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlyhdbI9DWvWwlKQmhlNUM86Tk0clxCh8LXg0j4nBZY=;
        b=Lmq1DY/L+euHSHyV80gKDPBsRKrXAxZi4yswoss0LSycNo15FdtxZFjp9UGXbjBvOU
         XgEmZAJnQnl9xHDceONswCElp50A3jqfh/lba7skb2mv/6CN+dVaZX/iG6Cnrl0qljtt
         /cekhH8YU2B5DGigzHTmo3QQP/Ms1e66JJ5M19Ph34AVPGH3yl9vsZ9hBiBMl9njTD7P
         +gbnhfcGwO1HUviPAwnJnFoFMD0/kYQBezpBLrys3Dv4JDoDqkrcCMf66ZRqKpqmJeth
         iEsiBN+QIqnrE7MIR4i4ip44HSByLf9nUxPWkx/XylndCYjey43M8egZYxamiP3+W0E6
         fevA==
X-Gm-Message-State: ANhLgQ38AO22dS6cBi/0KTt/+7YBFxko37xGDHs+E6ULy80PJNcXKGUC
	RpbYMLnTgxMNKBWhimSpnMDMMY1ea0Y=
X-Google-Smtp-Source: ADFU+vvUJrjQy67CXXRFXrkaMpBUFTuiCZlm6+Gq9O0VevrBPJDy7pW/wGK1ulzFLYVaocH0q/JbTw==
X-Received: by 2002:adf:f68b:: with SMTP id v11mr16268097wrp.270.1585607191875;
        Mon, 30 Mar 2020 15:26:31 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030968BA11C5DB455F3E0C.dip0.t-ipconnect.de. [2003:f0:7f03:968:ba11:c5db:455f:3e0c])
        by smtp.gmail.com with ESMTPSA id z1sm12002404wrp.90.2020.03.30.15.26.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:26:31 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/6] xfce4-clipman-plugin: upgrade 1.4.4 -> 1.6.0
Date: Tue, 31 Mar 2020 00:26:15 +0200
Message-Id: <20200330222616.2354-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330222616.2354-1-schnitzeltony@gmail.com>
References: <20200330222616.2354-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.6.0
=======================
This is a feature release.
Apart from fixing deprecations, improving the settings dialog and
small improvements to the panel plugin a new feature has been
introduced: xfce4-clipman-history.
It allows you to search the history interactively and paste directly (or
just update the clipboard by holding Ctrl).

- Add standalone dialog to search history: xfce4-clipman-history
- Don't delete the history on startup
- plugin: Indicate if clipman is disabled (Bug #11381)
- plugin: Bind middle-click to toggle "inhibit"
- plugin: Add "Clipman settings..." menuitem
- plugin: "Show full history..." menuitem
- plugin: Wire up max-menu-items setting
- settings: Make strings translatablei (Bug #16496)
- settings: Improve responsiveness of actions tab
- settings: Replace GtkStock icons and tweak actions dialog
- settings: Revamp UI and add max-menu-items setting
- settings: Further UI tweaks
- daemon: Show info dialog if already running
- Add warning if clipman is not running
- Show info/warning dialogs if clipman is (not) running
- Add clipman-settings desktop file
- Replace deprecated g_type_class_add_private
- Replace GtkStock items
- Improve clipman autostart file
- Update copyright
- Update gitignore
- Translation Updates:
  Albanian, Belarusian, Bulgarian, Catalan, Chinese (China),
  Chinese (Taiwan), Danish, Dutch, French, Galician, German,
  Hebrew, Hungarian, Italian, Japanese, Lithuanian, Norwegian
  Bokmål, Polish, Portuguese, Portuguese (Brazil), Russian,
  Serbian, Spanish, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-clipman-plugin_1.4.4.bb => xfce4-clipman-plugin_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.4.bb => xfce4-clipman-plugin_1.6.0.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.4.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.0.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.4.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.0.bb
index 164895013..c0f4a5d49 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.4.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.0.bb
@@ -8,8 +8,8 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[md5sum] = "104c917ef53a66f7aa2dca01b43c3b77"
-SRC_URI[sha256sum] = "08e14c5d0fcee9adb4bc77efc0ab4af2b12b3fe1ee5e2121fc60e877ac9c29a0"
+SRC_URI[md5sum] = "6db8e1b6ed2babab339a650c8f6d596b"
+SRC_URI[sha256sum] = "0295da92ade7d6e1d8b15a525e73ddcfba1986142d34c6143955164a13552ed7"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.21.1

