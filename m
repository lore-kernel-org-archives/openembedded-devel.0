Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.9410.1609946270141539394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s/cAeFCo;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id 6so5512414ejz.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pX8+BP141IwVtUI0u+QOnaOiS/KD/m47JI2JjU/P0Sc=;
        b=s/cAeFCoh7EbusSdybdXDTmCoSucnp/+JXwfyGodUy8cB5Dkr49QIVOfckYimbz3fM
         uzkOX1ZWCvBBt3wLEriqq/Z/TVYKwmCvYXNWh7ajw/tvG7JylJr6CeoC/IsZZhNYBZXk
         Am8S83jB1qAWRoEbWavKWRum6noSNpEAlpkOGCmJ/QdxLV2ElXumR34gYU/6gRmBO/CE
         7eqiEMo1aZzsWTl7fJxpuA4RVC5ItnYg5Hm3c5X83LdJ4IMzOVIJ9I5MnI3caHFy+2xJ
         MGl7NwxiDbMXlMnqFZopSRzSVWvzjeOoDGrqBvFT+1Bz6e0YuRT8P9a8aBNTAfP7XBUn
         GKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pX8+BP141IwVtUI0u+QOnaOiS/KD/m47JI2JjU/P0Sc=;
        b=hqskm8IFhWmniFLPFq6HRGw3eWNOhl3E7LXQ1j6yKfRFzmhHK4dU+Z+cvSBL2aX9xu
         76huGn/ssht8OfSyAw8SndWxrfVk/TuB9URk5zP9fR+b1l0NQIuzC555Q9qzh/zXATt5
         7/evZa69iMQS8+XWeOpLMO/1VuFx8xaOq+NoCG2ic9MVpE72VgcnQvOFBQYpcqV5C5mE
         34vtyaPcjk/9zJUK5VLFimITDNF9jQATLhEotyvpUP39rf8RZ7wY3WnesOCmLE6Nwo3Y
         NRj8PUXFiWlUwYPfHA5Gx6P5pjgIWPoSPLrhvlDcBbTZgZ8TeUYACA4m+yNn/vArD7AK
         UaTg==
X-Gm-Message-State: AOAM533ma2/L/4m/2kCT8Tb5xTUKbb5mcGa03ep4ol2tIoec2b91xDbo
	e+Dc9styBM/xE9SmrC6MkZ99MRqnsiN6Lg==
X-Google-Smtp-Source: ABdhPJziq5zJhIMWN6l91XoOHK13DEtaiRwN2i0/3UuuNt0D8coD1ssxJ74nI4xzvDG793p/X5bY2g==
X-Received: by 2002:a17:906:b04f:: with SMTP id bj15mr3005200ejb.383.1609946268718;
        Wed, 06 Jan 2021 07:17:48 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:47 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/28] thunar: upgrade 1.8.15 -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:04 +0100
Message-Id: <20210106151717.1779543-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Fix action of Back/Forward mouse gesture when using RTL (Issue #90)
- Prevent crash on mouse gesture action (Issue #443)
- Avoid crashes when closing thunar with ctrl+w (#336)
- Ignore double-click events from back/forward mouse button
  (Issue #371)
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump
- bump minimum required exo version to 4.15.3
- Wrap box around spinner to prevent flickering (Issue #440)
- Use g_drive_is_removable over g_drive_is_media_removable
- bump glib (and gio, gthread, etc) to 2.50.0
- Do not duplicate app_info when added via custom command (Issue #309)
- Escape all whitespace characters in custom command path
- Remove hidden quotes for "Open with"->"custom command" (Issue #425)
- Ignore unknown XML elements in UCA.xml
- Regression: Fix broken bulk renamer context menu (Issue #436)
- Revert of b12247c2 and proper fix for Issue #423
- Remove duplicated code in renamer and prevent possible leak
- Prevent possible crash of thunar_launcher_poke (Issue #436)
- Fix combo box entry order (Issue #435)
- Remove TODO file
- Change focus when clicking an emblem entry (Issue #315)
- Bump GLib minimum version to 2.44
- Prevent Gtk-CRITICAL when terminating session (Issue #430)
- Missing thunarx support on the shortcut view (Issue #423)
- Translation Updates:
  Basque, Chinese (China), Czech, Danish, Estonian, Korean, Norwegian
  Nynorsk, Turkish, Vietnamese

Release notes for 4.15.0
========================
This is a development release of Thunar aiming the upcoming release of
Xfce 4.16.

- Fix unavailable rubber banding in detailed view (Issue #326)
- Context menu entries in Thunar flutter while downloading (Issue #276)
- Improve cusor handling after file deletion in thunar (Issue #69)
- Fix regression: Trying to open a .desktop file from the context menu
  leads to the execution of the file (Issue #325)
- Use numbering on label "open new window/tab" only for multiple
  windows/tabs
  (MR #15)
- Remove "Sort by" and "View as" from menu item labels (Issue #247)
- Add new app icon and switch to rDNS icon name (MR #11)
- Replace deprecated GtkActionEntry with XfceGtkActionEntry (Issue #293)
- Menus are now updated when selection changes not only when opened
  (Issue #293)
- Merge all file-context-menus into one (Issue #198)
- Ghost file ocasionally remains when dropping file into directory
  (Fixes #312)
- Use XfceFilenameInput to validate long filenames (Bug #13720)
- Support for variables like $HOME in address bar (Bug #12165)
- Fix eject button click detection when using RTL languages (Bug #11387)
- Remove upper case from group names in shortcuts view
- Option to rename a file when existing copy conflicts (Bug #16686)
- Remove suffix "- FileManager" from window title
- Move from exo-csource to xdt-csource (Bug #16717)
- Pause button on copy/move (Bug #16685)
- Allow drag-and-drop of multiple files in icon view (Bug #2487)
- Add keywords to .desktop files to thunar (Bug #16618)
- Reduce vertical space in Templates info popup
- Hide android phone from network group (Bug #11584)
- Reduce size of Templates info popup
- Do not add "cant-write" emblem to files in the Trash
- Hide Browse Network entry in shortcuts view if not supported
- Move 'network' to the bottom of tree view (Bug #16516)
- Add examples to "Select by Pattern" dialog (Bug #16587)
- Improve tooltips in shortcuts view (Bug #16566)
- Rename "Disconnect" context menu entry in side pane (Bug #16558)
- Make path entry matching case-insensitive (Bug #12747)
- Add new bookmarks to bottom of list in shortcuts view (Bug #16526)
- Move places above devices in shortcuts view (Bug #11586)
- Add desktop actions for home, computer and trash (Bug #16497)
- Option to use static icon instead of folder icon (Bug #16501)
- Remove top level desktop entry from tree view (Bug #16474)
- Easy access to computer:/// (Bug #16472)
- Use libxfce4ui close-multiple-tab dialog (Bug #16254)
- Replace deprecated G_FILE_MONITOR_EVENT_MOVED (Bug #16328)
- Use symbolic icon for eject (Bug #16281)
- Prevent ghost files after "move" on remote locations (Bug #15704)
- Add a confirmation dialog when closing a window with multiple open
  tabs.
- Improve explanation string for "invert selection" action (Bug #15625)
- Improve layout of Permissions tab (Bug #15557)
- Remove superfluous shell script "ThunarBulkRename" (Bug #15373)
- Make labels in permissions chooser wrap
- Add a small delay when dismissing notifications (Bug #14552)
- File / Folder size text in statusbar sometimes is ambiguous (Bug
  #14203)
- Add missing parameter to ThunarBrowserPokeDeviceFunc function
- Add property to enable/disable frames on thumbnails (Bug #14433)
- Improved spacing between widgets in Properties and Preferences
  dialogs
- Fixed numerous compiler warnings
- Fixed numerous warning and critical messages
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian, Armenian (Armenia), Asturian,
  Basque, Belarusian, Bengali, Bulgarian, Catalan, Chinese (China),
  Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United Kingdom),
  Esperanto, Estonian, Finnish, French, Galician, German, Greek,
  Hebrew, Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Latvian, Lithuanian, Malay, Norwegian Bokmål,
  Norwegian Nynorsk, Occitan (post 1500), Panjabi (Punjabi), Persian
  (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian, Russian,
  Serbian, Slovak, Slovenian, Spanish, Swedish, Telugu, Thai, Turkish,
  Uighur, Ukrainian, Urdu, Urdu (Pakistan), Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_1.8.15.bb => thunar_4.16.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.15.bb => thunar_4.16.0.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
index b1f1c967a..ae05f867f 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.15.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
@@ -8,8 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "303010f4959fa23f7c13c0ccd9b8527e"
-SRC_URI[sha256sum] = "7624560cf21f13869804947042610aab22075146b711593f11ceb9e494277c93"
+SRC_URI[sha256sum] = "6277c448116a91ebfa564972645d8d79ef69864992a02bb164b7b13f98fdfd9b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.26.2

