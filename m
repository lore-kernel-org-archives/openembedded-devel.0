Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.9451.1609946260167249594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SzXWc/Dt;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id cm17so4729941edb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9crZS6Mo0uA2eqIejJJd2hhDDIA9P8cPuIvX59FHpb0=;
        b=SzXWc/DtVOyEuNO4wvr40YHAtlpyOr2Yo5Ka9lrlzm7taPrtjaEGcMEvgYMCUUXgdD
         uiawmSZdQxI4g2zTs1bglDIdO566JYEx23jFO1TWHU3aGY1+Uex9db4NFFzJ1OTpPXuY
         b6QIyd96lQ+A8Xnfd+63UNAVkG09DLONCpk8YioVTST03IReJgCdtJNx4hNWpeDcSzZB
         ijF/m0jAwV1Aozk23vujJkY8Go5aKawk4ca41HOhHcvzXSsniWVXNNekDKAr3qy/gra9
         lo754rGVO+jsiKMSK/qNjAFuIc54A/G0Nw8VZp3UhhRotMPuPooRiRim0x3nX/DEvXo8
         CYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9crZS6Mo0uA2eqIejJJd2hhDDIA9P8cPuIvX59FHpb0=;
        b=OYC57PmVkuqcJax2uRIkW2Fc0/9LgWl9QuUz+mhkh3M8vGTar5ahYksEZU/5SrZs7K
         RuN7yhMLUn4yIu/KYR5QjwAnuSr5w8K7QVanQuEw3WM9m1CVfE/odvDwPHYQ1mLuwBel
         LauljkZeY/tILnKvHJJRbKH8+u24mCLwhie8XDv+PlQUZ/pZ6LzSUuDPIlVwQQMDJLBq
         /0zWE9WXhfyn4qn3nNxUoG2THEKVkYhUDPRaQ3PxAp63lRvaa315lcnWSgLPYxfziU0g
         OgBEqBfOxrThhuA6zxhxT2qmv8E9dC0krjF0ZnpEbxnF+sw4qpKKpeBQNtzELkco9LJh
         UAJA==
X-Gm-Message-State: AOAM532kWuCa32OcLl1cXHx25b3NLrcQlAfD7c8vzXzRg6vshatSskNZ
	aXNDcqnga8jwSyTIAM0oO7V5nZXXCCLbmA==
X-Google-Smtp-Source: ABdhPJya0hu3cQANLNu9dRXddIxPg+1RFA9QhvdXztaU+50G78A1SNshV7ozYtAuC/tOd7IGZoudAg==
X-Received: by 2002:a05:6402:307c:: with SMTP id bs28mr4325053edb.186.1609946258713;
        Wed, 06 Jan 2021 07:17:38 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:37 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/28] xfce4-settings: upgrade 4.14.3 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:57 +0100
Message-Id: <20210106151717.1779543-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Drop subtitles from settings dialogs (Fixes #239)
- display: Fix icon name in settings dialog
- settings-manager: Fix visibility of filterbar
- settings-manager: Correctly show/hide the filterbar
- settings-manager: Switch to GtkSearchEntry
- settings-manager: Put filter in separate bar (Fixes #226)
- appearance: Add 'Add' button to install themes (Fixes #193)
- color: Tweak colors  of icon
- mime: Accept Thunar's old id name (Fixes #247)
- settings-editor: Enable tooltips and ellipsizing for `Value` column
- settings-editor: Fix scrollbar for channels
- settings-editor: Point to correct docs URL (#245)
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- Remove GSourceFunc casts
- Indentation fixes
- Translation Updates:
  Basque, Bulgarian, Estonian, French, German, Hebrew, Indonesian,
  Italian, Japanese, Norwegian Bokmål, Norwegian Nynorsk, Portuguese,
  Portuguese (Brazil), Russian, Serbian, Slovenian, Swedish, Turkish,
  Ukrainian

Release notes for 4.15.3
========================
[Please note that this is a development release.]
- Disable UPower support by default
- Add 24px and 32px icons
- xfsettingsd: avoid default double fork
- mime: Add 'Open with...' button
- mime: Add new generic launcher icons
- color: Adjust padding of dialog
- color: Add labels to toolbar
- keyboard: Make 'system defaults' a GtkSwitch
- keyboard: Adjust width of shortcut column (Fixes #223)
- keyboard: Update dialog UI
- keyboard: Make all table columns sortable
- keyboard: Improve inline toolbar alignment
- display: Center minimal dialog on monitor where cursor is
- settings-editor: Add labels to toolbar items
- Update README file
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Belarusian
  (Tarask), Bengali, Bulgarian, Catalan, Chinese (China), Chinese (Hong
  Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern
  Armenian, English (Australia), English (Canada), English (United
  Kingdom), Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Lithuanian, Malay, Norwegian Bokmål, Norwegian
  Nynorsk, Occitan (post 1500), Polish, Portuguese, Portuguese
  (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian, Spanish,
  Swedish, Thai, Turkish, Ukrainian, Uyghur

Release notes for 4.15.2
========================
[Please note that this is a development release.]

- appearance: Fix width of DPI spinbutton (Bug #16125)
- appearence: Sync theme, icon, font names to gsettings
- appearance: Fix list refresh on DnD (Fixes #213)
- appearance: Drop toolbar style setting (Bug #16665)
- display: Initial fractional scaling support (Fixes #162)
- display: Custom scale changes are display changes
- display: Improve layout in settings dialog
- display: Resize display widget according to scale
- display: Move scaling presets to glade
- display: Set minimum scale to 0.1
- display: Improve state machine for scaling option
- xfsettingsd: Correctly get current xrandr scale
- mime-settings: Rename dialog and icon to 'Default Applications'
- mime-settings: Fix window icon name
- mime-settings: Fix double free
- mime-helpers: Fix Nautilus icon name
- mime-helpers: Rename Thunar to thunar
- Rename Thunar to thunar in make and potfiles
- Expand desktop entry field codes
- keyboard-settings: Support libxfce4ui XfceTitledDialog new API
- keyboard: Show shortcuts with keycap class
- settings-manager: Ensure searchbox has initial focus (Bug #16890)
- settings-manager: Simplify redrawing of search results (Fixes #141)
- settings-manager: Hide filter entry in plugged dialogs
- Convert xfce4-compose-mail to Python
- Add dependency to Python3
- Use just binary name (instead of full path) as argument
- Don't crash when upowerd isnt present (bug #60)
- Always install shiny new icons
- Drop libxfce4ui 4.15.1 ifdefs
- Fix xfconf-related memory leaks
- Update .gitignore
- Fix typo
- Translation Updates:
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Danish, Dutch, English (Canada), Estonian,
  Finnish, French, German, Hebrew, Hungarian, Indonesian,
  Italian, Japanese, Kazakh, Korean, Lithuanian, Norwegian Bokmål,
  Serbian, Swedish, Turkish

Release notes for 4.15.0
========================
[Please note that this is a development release.]
- xsettings: Use CSD for GtkDialogs by default
- settings-manager: Fix XfceTitledDialog layout with CSD
- settings-manager: Drop setting the old header style
- display: Show ratio next to display resolution
- display: Mark preferred mode with an asterisk
- display: Add init function for aspect ratios
- display: Right-align the display ratio
- display: Fixed warning and removed ratio
- display: Improve look of ratio
- display: Fix icon name for primary indicator
- display: Initialize crtc->scalex/y (Bug #15971)
- settings-editor: Add consistent inline-toolbar
- appearance: Only show themes that support Gtk3 (Bug #15849)
- color: Fix crash in add-profiles dialog (Bug #15876)
- color: Conditionally hide info button in add-profile dialog
- color: Add tooltip to profile info buttons
- display: Fix profile matching in xfsettingsd
- display: Assure correct gchar** (Bug #15816)
- keyboard: Improve layout of add-command dialog
- keyboard: Add mnemonics to add-command dialog (Bug #10495)
- Switch to symbolic window-close icon
- Bump libxfce4ui dependency to 4.15.1
- Improve string for session managers
- Ensure the newly labeled 'Xfce Settings Daemon' is translated
- Do not show translation info on --help output
- Translation Updates:
  Albanian, Arabic, Basque, Belarusian, Bulgarian, Catalan,
  Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, English (United Kingdom), Finnish, French, Galician,
  German, Greek, Hebrew, Hungarian, Indonesian, Interlingue,
  Italian, Japanese, Korean, Lithuanian, Malay, Norwegian Bokmål,
  Polish, Portuguese, Portuguese (Brazil), Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Thai, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-settings_4.14.3.bb => xfce4-settings_4.16.0.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.3.bb => xfce4-settings_4.16.0.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.3.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
index 08c612aa7..47de8c571 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
@@ -2,17 +2,14 @@ SUMMARY = "Xfce4 settings"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo exo-native garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
+DEPENDS = "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
 
-inherit xfce features_check
+inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " \
-    file://0001-xsettings.xml-Set-default-themes.patch \
-"
-SRC_URI[md5sum] = "fe8f7d4221be1467b85c8539344c3f07"
-SRC_URI[sha256sum] = "cab1a4d5351f9871533700523570f86f92bbe6e4055f44e5df950eb4b4f48bb3"
+SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
+SRC_URI[sha256sum] = "67a1404fc754c675c6431e22a8fe0e5d79644fdfadbfe25a4523d68e1442ddc2"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.26.2

