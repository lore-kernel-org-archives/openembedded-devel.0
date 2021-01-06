Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.9413.1609946261469982649
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nofpjFUL;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b73so4628113edf.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZdQW6HGJ8Or9UZzLxlDcaiy26T/DAdu9W8rGlYxNqN4=;
        b=nofpjFUL7h/7Gq9qPiI7u8amORy92TDhpvoNCPzCnoGvXfRuWhQF3jSNE2E5GcLc95
         mOpOIyziG3XiAv3i5ySFTWI8nqx4h/KtR+8FZuS3zyGB/oGGaXHQmLxF9lIYNosv4gP9
         LchDfQdN3qRUgSLmSE+p0ofhme4018qL2V6hbToj4JLu01Kx86YO8kWx3GdBhP2NI6BE
         QXul+EXUlrxX14+eoKizdPA1ktgierDkAOM6qo4Bfbe0BpjrVBQjjTytqUxxq8iL+8IZ
         l50cl3vmDL1cBfsUAXHXr8yuu7wg1JBFN9ljBymvZhPzdBqvdmtSV7LZ4wrrRQ+lDejJ
         0pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZdQW6HGJ8Or9UZzLxlDcaiy26T/DAdu9W8rGlYxNqN4=;
        b=ub4PsjbVLx9I1HgVwMtbtv/CovABtSxT8fG8+sgfgqxKxCK0b4o/eTn6LI8s9CD5RG
         WLruLDBE53O0VMIXd1Sm3Gfv8xOBLshMD4z6Hu4eBk0d2/jtO/eW6emekeD+KpR54Tcw
         fOkvOVzqD4vu5EWtYyfhTe6OdIHdTQdtwRHw3wshA6/w2LNvrn81xYEjvNpMFMA+PdcK
         hTdc3tQHHI+UC8I9fl+i9pZjGH8Opx2CV3xhsSw6clGDdkZBwxpiIMZP1I+iUUNUFHib
         s7JAKyKNzVQd80E0PNliE1ycdE7CXnmRv2jqI2lafz/3zVIarJ2GH/YOqM5+6GrwAC3S
         SCxg==
X-Gm-Message-State: AOAM532TmtvyRFZJpnSPQZIatIfOgpCdP4mrLkR8Bq8rf+Mca6DdkHkh
	1k4DKkLOYnBKzixC9kzn8Tje8fQw0cAQ8A==
X-Google-Smtp-Source: ABdhPJzgfCCYABZyrXaEsB9wgzc8NGFpOc6hRtDXIrm/i+G3wlZ6yQwjqTvtgxk4I16x8FkAjZaRTg==
X-Received: by 2002:aa7:c353:: with SMTP id j19mr4295679edr.204.1609946260037;
        Wed, 06 Jan 2021 07:17:40 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:39 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/28] xfce4-panel: upgrade 4.14.4 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:58 +0100
Message-Id: <20210106151717.1779543-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- panel: Fix intellihide with CSD (Fixes #368)
- tasklist: Fix wireframe for CSD windows (Fixes #338)
- tasklist: Auto-adjust icon size (Closes #90)
- Revert "tasklist: Auto-adjust icon size (Closes #90)"
- Fix GSourceFunc removal
- Remove GSourceFunc casts
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump

Release notes for 4.15.6
========================
[Please note that this is a development release.]
- settings: Use spinbuttons for size and nrows
- settings: Update item listview toolbar
- Make dbusmenu-gtk3-0.4 optional, disables StatusNotifier integration
- gobject introspection wants a capital letter for the gir file
- Use new xfce_spawn API
- Bump GLib (and gio, gthread, etc) minimum to 2.50.0
- Update .gitignore
- Add README.md to EXTRA_DIST
- Fix compiler warnings
- Fix memory leaks
- Drop generated code from repo
- Revert "launcher: Appear "checked" on click (Fixes #256)"
- Translation Updates:
  Chinese (China), Estonian, Norwegian Nynorsk, Russian, Serbian,
  Slovak, Slovenian, Turkish, Vietnamese

Release notes for 4.15.5
========================
[Please note that this is a development release.]

- actions: Switch to new session icons (Fixes #332)
- add-items: Drop not-so-helpful dialog subtitle
- add-items: Bump default dialog size (Fixes #258)
- launcher: Appear "checked" on click (Fixes #256)
- tasklist: Limit blinking notification
- intellihide: Check if cursor is over the panel (Fixes #311)
- launcher: Set plugin icon as fallback (Fixes #329)
- Add new README.md
- Fixed icon for about dialog and added more icons for better scaling
- Unref datetime objects
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Basque, Belarusian,
  Bengali, Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong),
  Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian,
  English (Australia), English (United Kingdom), Estonian, Finnish,
  French, Galician, Georgian, German, Greek, Hebrew, Hungarian,
  Icelandic, Indonesian, Interlingue, Italian, Japanese, Kazakh,
  Korean, Lithuanian, Malay, Norwegian Bokmål, Norwegian Nynorsk,
  Occitan (post 1500), Panjabi (Punjabi), Polish, Portuguese,
  Portuguese (Brazil), Romanian, Russian, Serbian, Sinhala, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Uyghur,
  Vietnamese

Release notes for 4.15.4
========================
[Please note that this is a development release.]

- New plugin: statustray (supports statusnotifier and systray)
- plugins: Add new rDNS icons for all plugins
- Use shared field codes expansion
- tasklist: Add "Launch New Instance" item to menu (Fixes #158)
- Translation Updates:
  Albanian, Chinese (China), Chinese (Taiwan), Croatian, Estonian,
  French, Hebrew, Japanese, Kazakh, Korean, Lithuanian, Norwegian
  Bokmål, Polish, Portuguese, Portuguese (Brazil), Serbian, Swedish,
  Turkish

Release notes for 4.15.3
========================
[Please note that this is a development release.]

- Add new app icon and rDNS icon name
- Fix background of 48px app icons (Bug #16873)
- dark-mode: Make property unique across panels
- tasklist: Allow keyboard navigation within groups (Fixes #270)
- applicationsmenu: Correctly block autohiding (Fixes #287)
- action buttons: Fix combobox signal
- action buttons: Drop 'inverted buttons' setting (#223)
- action buttons: Add button title options (Bug #8980)
- action buttons: Fix separator width (Bug #15558)
- launcher: Fix launcher menu button state (Fixes #264)
- launcher: Fix crash with actions menu (Bug #16823)
- launcher: Fix in default panel configuration
- Improve docs for xfce_panel_plugin_position_widget (Bug #9438)
- Add Gio to libxfce4panel gir includes
- Add basic GitLab pipeline
- Fix whitespace error
- Fix panel build with vala 0.48 (Bug #16426)
- Fix build
- Update gitignore (Fixes #295)
- Drop references to Gtk2 and 4.6 panel plugins
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Belarusian, Bengali,
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian, English
  (Australia), English (United Kingdom), Estonian, Finnish, French,
  Galician, Georgian, German, Greek, Hebrew, Hungarian, Icelandic,
  Indonesian, Interlingue, Italian, Japanese, Kazakh, Korean,
  Lithuanian, Malay, Norwegian Bokmål, Norwegian Nynorsk,
  Occitan (post 1500), Panjabi (Punjabi), Polish, Portuguese,
  Portuguese (Brazil), Romanian, Russian, Sinhala, Slovak,
  Slovenian, Spanish, Swedish, Thai, Turkish,
  Uighur, Ukrainian, Vietnamese

Release notes for 4.15.2
========================
[Please note that this is a development release.]

- panel: Improve autohide animation
- panel: Add "popdown-speed" property to adjust autohide animation
- panel: Fix autohide state machine
- panel: Fix cancellation of autohide animation
- panel: Immediately show panel in intellihide
- panel: Don't tamper with leave_opacity value (Bug #16296)
- launcher: Show desktop actions in context menu
- plugin: Show custom menu items below plugin name
- tasklist: Hide brackets for min windows by default
- tasklist: Fix crash middle-click-closing grouped windows (Bug #16410)
- systray: Basic support for symbolic icons
- systray: Silence deprecation warnings
- systray: Remove superfluous warning
- Improve wording in "Remove plugin" dialog (Bug #9000)
- settings: Add keywords for discoverability (Bug #10694)
- Fix GTimeVal deprecation (Bug #16643)
- Fix memory leak in panel plugin wrapper (Bug #16640)
- Update docstring
- Update libxfce4panel symbols
- Make var names more consistent
- Fix cast
- Fix typo
- Fix indentation
- Translation Updates:
  Albanian, Basque, Belarusian, Bulgarian, Catalan, Chinese (China),
  Chinese (Taiwan), Croatian, Danish, Dutch, Finnish, French, Galician,
  Georgian, German, Hebrew, Hungarian, Italian, Japanese, Kazakh,
  Lithuanian, Malay, Norwegian Bokmål, Polish, Portuguese, Portuguese
  (Brazil), Russian, Serbian, Slovenian, Spanish, Turkish, Ukrainian

Release notes for 4.15.1
========================
[Please note that this is a development release.]

- Enable dark-mode by default
- tic-tac-toe: Fix XfceTitledDialog with CSD
- add-item dialog: Fix XfceTitledDialog with CSD
- systray: Improve app icon lookup
- directorymenu: Add create folder/document menuitems (Bug #15639)
- directorymenu: Add option to hide folder/terminal menuitems (Bug
- plugins: Fix enter/leave opacity w/o compositing (Bug #14577)
- clock: Drop leading zeros for days in default layout
- clock: Add back hour:min to format presets (Bug #16035)
- panel: Make sure "span monitors" is conditionally sensitive
- tasklist: Fix drag&drop in deskbar mode (Bug #16298)
- Fix autohide with bg color or image (Bug #16064)
- Improve the marching ants animation
- Remove extra underscore (Bug #16266)
- Use an empty placeholder icon for launcher (Bug #15819)
- Always provide files for vala binding in dist tarball
- Replace GtkStock icon
- Use symbolic window-close button image
- Fix doc typos
- Fix indentation
- Translation Updates:
  Albanian, Basque, Bulgarian, Catalan, Chinese (China), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, English
  (United Kingdom), Finnish, French, Galician, Georgian, German,
  Greek, Hungarian, Interlingue, Italian, Japanese, Lithuanian,
  Norwegian Bokmål, Polish, Portuguese, Portuguese (Brazil),
  Russian, Serbian, Slovak, Slovenian, Spanish, Swedish, Turkish

Release notes for 4.15.0
========================
- Drop support for Gtk2 and 4.6 plugins
 - Drop Gtk2/4.6-only references from the docs
 - Don't show or try to load Gtk2 plugins anymore
 - Add dark mode preference
 - autohide: Add sliding out animation
 - Draw panel border based on position and length
 - appmenu: Listen to icon theme changes (Bug #15861)
 - appmenu: Use panel's icon size
 - clock: Validate timezone entry (Bug #16036)
 - prefs: Plug memory leaks (Bug #16016)
 - docs: Fix build by dropping unused refs (Bug #16031)
 - pager: Fix scrolling in pager-buttons (Bug #15614)
 - pager: Face-lift of settings dialog
 - pager: Only show scroll-option with buttons
 - pager: Add option to show workspace number
 - systray: Drop "Show frame" option (Bug #14186)
 - tasklist: Resize when windows get removed (Bug #14394)
 - systray: Fix icons without compositing (Bug #14577)
 - windowlist: Make layout consistent with xfdesktop
 - windowlist: Replace deprecated gtk_widget_modify_font
 - launcher: Fix visual state of arrow-button (Bug #15818)
 - launcher: Avoid excessive left padding on popup menu (Bug #15819)
 - Fix typos and improve code formatting
 - Translation Updates:
   Albanian, Arabic, Armenian (Armenia), Belarusian, Bulgarian, Chinese
   (China), Chinese (Taiwan), Croatian, Danish, Dutch, French,
   Galician, German, Greek, Hebrew, Hungarian, Indonesian, Italian,
   Japanese, Lithuanian, Malay, Norwegian Bokmål, Polish, Portuguese,
   Portuguese (Brazil), Russian, Serbian, Slovak, Spanish, Swedish,
   Thai, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-panel_4.14.4.bb => xfce4-panel_4.16.0.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.14.4.bb => xfce4-panel_4.16.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.4.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.4.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.0.bb
index 73cb82a15..0b210ffcc 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.0.bb
@@ -8,8 +8,7 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "76efdbf7fb461f3058919c1309da67ca"
-SRC_URI[sha256sum] = "8e5ea79412ba84cfada897ff309cbe2cd4aca16b9bd4f93df060229528576fd5"
+SRC_URI[sha256sum] = "5e979aeeb37d306d72858b1bc67448222ea7a68de01409055b846cd31f3cc53d"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-- 
2.26.2

