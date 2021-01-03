Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.19840.1609637170532206987
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S3QS/YzD;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id 91so27339060wrj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MYW0BQizb/Nt0te6BZb/CDqntzTcidLFhu/AWVVGPOE=;
        b=S3QS/YzDAPDHYJIp9HNNKy3fPKFzCb6twSW5Q/R5YMx+vB4xanD20s+5dP1jz3qT8R
         TNFtPGtdl+DH2ABPc+GcvLkZzhEvNf4oWmAgLOS3IpvyB5QytlOcyt6y+/p7PRFiwm9J
         JxgTjfOhWvU+m4Dz7P0GUEcbVH81fupTgrpI3yMX5SAkuB3O5tJsxKhcw3F3ik+Ad1Rs
         nOEWfbQ7NvXc/VRN+G8pI/0ooKOOok168QGLQrH/MzeR9XaA4eKAXvPAo8plUDa1aQfZ
         42R15A4OjC/HPn7y5Lpj1ekV/K482Yx56wbZjVZu2SSWlKYmVinNuWBpR81QUaJdYoL5
         u56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MYW0BQizb/Nt0te6BZb/CDqntzTcidLFhu/AWVVGPOE=;
        b=kXmCEfKh4g0kGE/XOfBWS1tUwRtrU5km/M+YdPi2LEihv01PBqx+k/DhiRe2GPJXIW
         YVfQJbM2n0Eyv41vjmqgJuXjQuiEOoJuyAWP8OuFvXbq6yBbpnEsHK+OyV5Skt/7G3ZI
         mpGLbJRqOXGhzhFVb8cTWnqC8gSuE+ztw2ovUY0W2VVJMNbJGSg0dQ7PED3ADpVtnDil
         laHy+UWRZfAYw2QXI/u0poryUCyZiIB0yDCJjmII96AIg9geu4QqJf00XuPxq+QF3qEv
         jyRs6Wr4uS1W6tJWgFKEgAmnZqryLVbiF5LkeSh5q+f8f3i5tTk9Xr420QWQOP7dm241
         RCtg==
X-Gm-Message-State: AOAM531YQ1bk78+a3gLposrHpKnpVSiJmxSzWEpSF98FokH5dbJiTzDD
	4zoFBBRtibB/4N5GjNfx1MAFNhTnloI9/Q==
X-Google-Smtp-Source: ABdhPJyBxeOrGoxXvQyQJeHom8vuS0nPtSO6VCz3uORVqt18bnEBJ8Z8/Y7wMqE9hEMgIPWmIqkOQA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr74655579wrn.171.1609637169218;
        Sat, 02 Jan 2021 17:26:09 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:08 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/16] mousepad: upgrade 0.4.2 -> 0.5.2
Date: Sun,  3 Jan 2021 02:25:43 +0100
Message-Id: <20210103012556.557336-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.1
=======================
- Dependency Changes:
  - GLib >= 2.52.0
  - GTK >= 3.22.0

- New Features:
  - Allow to change the font size from keyboard/mouse (#46, #54, !60)
  - Switch to asynchronous search (!58)
  - Give more choice for whitespace display (#44, !46)

- Appearance Changes:
  - Improve the look of the search bar
  - Add a spinner to the search widgets
  - Make the occurrences count appear in the search bar
  - Reformulate "Home/End Keys" setting description

- Code Refactoring:
  - Code refactoring around MousepadView properties (!60)
  - Code refactoring around GMenuModel-bindings (!50)

- Bug Fixes:
  - Decrease reference count of anchored documents
  - Filter document signals on the active document
  - Fix a memory leak in the templates menu
  - Fix wrong conversion from uri to filename (#81)
  - Warn when using GLib functions newer than requirements
    (Mousepad 0.5.0 actually required GLib 2.60 due to such an
oversight)

- Translation Updates:
  Catalan, Chinese (Taiwan), French, German, Italian, Japanese,
  Lithuanian, Norwegian Bokmål, Portuguese, Portuguese (Brazil),
  Russian, Serbian, Spanish, Swedish, Turkish

Release notes for 0.5.0
=======================
- Bump required GTK+ in `mousepad-prefs-dialog.ui` (#78)
- Fix an oversight in updating actions state (#76)
- Remove TODO file (#74)
- Ensure that opening modes are excluded from translation
- Translation Updates:
  Albanian, Bulgarian, Chinese (China), Dutch, French, German, Greek,
  Hebrew, Indonesian, Italian, Norwegian Bokmål, Portuguese,
  Portuguese (Brazil), Slovenian, Spanish

Release notes for 0.4.90
========================
[Please note that this is a release candidate for upcoming stable
version 0.5, released in about a week if nothing blocks.]

- Dependency Changes:
  - GLib >= 2.45.8
  - GTK+ >= 3.20
  - GtkSourceView >= 3.24
  - GTK+ 2 support has been removed
  - GtkSourceView 2 support has been removed

- New Features:
  - Add keybindings to show the menubar temporarily when hidden
  - Add command line option and setting for file opening mode
  - Improve encoding dialog
  - Add regex search

- Discontinued Features
  - multi-select (GTK+ 2)

- Appearance Changes
  - Replace `$HOME` with a tilde in displayed filename
  - Add new default keybindings and reveal some hidden ones
  - Search bar tweaks
  - Make tabs expanded for consistency with other Xfce programs
  - Add copyright and license info to About dialog
  - Improve label texts of "Find and Replace" dialog and search bar
  - Make the statusbar smaller
  - Add new app icon and switch to reverse DNS name
  - Save the state of the "highlight all" button in the search bar
  - Update window title of Find and Replace dialog
  - Add "Wrap around" check box to Find and Replace dialog (Bug #11290)
  - Infer filetype from shebang line (Bug #10514)
  - Show info when Templates directory does not exist (Bug #10486)

- Code Refactoring
  - Restore the use of the file `accels.scm`
  - Code refactoring around saving and restoring window geometry
  - Improve save-related actions
  - Fully switch to GtkApplication
  - Avoid deprecation warnings 5: CSS related
  - Avoid deprecation warnings 4: GtkUIManager and GtkAction
  - GtkStock
  - Avoid deprecation warnings 2: miscellaneous
  - Avoid deprecation warnings 1: alignment and padding
  - Avoid compilation warnings other than deprecation
  - Remove support for GTK+2
  - Switch to README.md and foreign automake mode
  - Add basic GitLab pipeline

- Bug Fixes:
  - Remove README.md from DISTCLEANFILES, it's not generated
  - Fix crash when dragging tab to GSV widget
  - Change GtkTextView wrap mode to GTK_WRAP_WORD_CHAR
  - Initialize the recent manager if needed at startup
  - Prevent search bar from overlapping the document
  - Properly disconnect signal handlers
  - Fix make distcheck
  - Fix color modifications in search entries
  - Do not open an empty document when encoding failed
  - Do not search for previously selected text
  - Update search field with selected text
  - Bug #16717: Move from exo-csource to xdt-csource
  - Remember last save location (Bug #14165)
  - Use g_get_user_dir to get Templates directory (Bug #11048)
  - Sync remaining menu actions to their settings (Bug #11046)
  - Install appstream in metainfo folder (Bug #11200)
  - Add appdata file (Bug #11200)
  - Fix building with `--enable-dbus --disable-gtk3`
  - Change visibility of fullscreen bars after small delay (Bug #9735)
  - Fix return type of fullscreen settings (Bug #9735)

- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Kazakh, Korean, Lithuanian, Malay, Norwegian Bokmål, Norwegian
  Nynorsk, Occitan (post 1500), Polish, Portuguese, Portuguese
  (Brazil), Romanian, Russian, Serbian, Slovak, Slovenian, Spanish,
  Swedish, Telugu, Thai, Turkish, Ukrainian, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mousepad/{mousepad_0.4.2.bb => mousepad_0.5.1.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.2.bb => mousepad_0.5.1.bb} (67%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.1.bb
similarity index 67%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.5.1.bb
index 29038ac19..ae2d7f83e 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.2.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.1.bb
@@ -7,10 +7,11 @@ DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[md5sum] = "98d908842d4a93c35756a67d681c08fe"
-SRC_URI[sha256sum] = "84c02adfca7f8b33b9466a306ded72fb9f38f93c9edb78660343854c4a3aded7"
+SRC_URI[md5sum] = "3083c9f5627948714a46ef360e3ae27a"
+SRC_URI[sha256sum] = "3d2e277b1ae82dd0f0fa25e27169491fc38c2b70a9a624f2ea472604b317a582"
 
 FILES_${PN} += " \
     ${datadir}/glib-2.0/schemas \
+    ${datadir}/metainfo \
     ${datadir}/polkit-1 \
 "
-- 
2.26.2

