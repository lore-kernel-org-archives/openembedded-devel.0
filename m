Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0FAC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:32 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.5013.1646383831109750102
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a4woKbI/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id w37so6960242pga.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWmDHP0x/Q4RCVz2XCbgkJol6qw+uwj/1jM1DuVb6pg=;
        b=a4woKbI/ZHhMmj8OY1zHoXfrvTS9oz/KIKQiuiloh848TnrclIi8dqFpt5cxr8pILO
         aC/HMxxcfJXSSu6NelbjInGMQrRVOVR7GPyUxuuuVE+BltLFysWFzd7EyQSpSco+SWO0
         daPySZiKBsAwuUdgYtXsr4tb1idFYUaOL0D5s1toD9CAoLbwoNnq+45Y2ZvAy8didl4s
         FhOf3jc8JU++guO1xQ4c6H5q+Fl544jfDPeqSpiq+Zh8AF7nW3QJUC77W00kcko/9/Lp
         DVt5YCV4syP9LIoEunEuG69BfXGl/i+82JBqD3STfEZAfSIdEHsIL8vwMAHGmJFAyVJX
         6EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWmDHP0x/Q4RCVz2XCbgkJol6qw+uwj/1jM1DuVb6pg=;
        b=8PsGPb2eIhRPyBELVjgzsQ+UuQ8v6WnPCuJEw3/9n+nmZfrGig0yJMo0j9SXQve+ao
         WvAQvJt7qx//ePjbW8cpXUfTYW01PPnoje6W/WHx5ECMRdvQZ7PnxOpcYY6jCjnNiP/Z
         PJ9r+6e/SuiaOWqVRDPg8qAOBJ4s1weIgQCL7fvY7rCS6TWb/65uPFe12f4Yt2RS3+ew
         /qVtdqBYtYI7lrJ8+UmAbO1AaQqXMex9Ob3tG8DcGiG77bU9j4MtoSu+UVAI+ld+QiGj
         jtc5Di+HufcAvYCb6dv4IHYKTqmXO45nLLR4Z0V8HfV6fGEECP5/4qvPaL8fjB2Ny5gL
         xkeA==
X-Gm-Message-State: AOAM533zwxiqUN7Tg0iC2L0qowv8T1Rrd+oph/j7BsPy1IKGlbph9rLi
	yuZTPioyATHdQJ+2PSRDgEe90im0ARuymA==
X-Google-Smtp-Source: 
 ABdhPJwNyUgUjzAlqXVqabR41DB9vc5goeU+SZylNEbFKjkHPvWJ1HATNtMhPam2YaYhfSWgzln+DA==
X-Received: by 2002:a63:d252:0:b0:363:271c:fe63 with SMTP id
 t18-20020a63d252000000b00363271cfe63mr33786411pgi.524.1646383829889;
        Fri, 04 Mar 2022 00:50:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 10/10] recipes: Update LICENSE variable to use SPDX
 license identifiers
Date: Fri,  4 Mar 2022 00:50:18 -0800
Message-Id: <20220304085018.1255075-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95777

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb                | 2 +-
 meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb                   | 2 +-
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb             | 2 +-
 meta-xfce/recipes-apps/mousepad/mousepad_0.5.8.bb               | 2 +-
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb                    | 2 +-
 meta-xfce/recipes-apps/ristretto/ristretto_0.12.1.bb            | 2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb               | 2 +-
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb           | 2 +-
 .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb       | 2 +-
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb     | 2 +-
 .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb         | 2 +-
 .../recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb  | 2 +-
 .../xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb            | 2 +-
 .../recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb   | 2 +-
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb  | 2 +-
 .../recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb      | 2 +-
 meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb      | 2 +-
 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb       | 2 +-
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb            | 2 +-
 meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb       | 2 +-
 meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb            | 2 +-
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb                  | 2 +-
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb               | 2 +-
 .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb | 2 +-
 .../calculator/xfce4-calculator-plugin_0.7.1.bb                 | 2 +-
 .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb | 2 +-
 .../closebutton/xfce4-closebutton-plugin_git.bb                 | 2 +-
 .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.5.bb | 2 +-
 .../cpugraph/xfce4-cpugraph-plugin_1.2.5.bb                     | 2 +-
 .../datetime/xfce4-datetime-plugin_0.8.1.bb                     | 2 +-
 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb | 2 +-
 .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb   | 2 +-
 .../mailwatch/xfce4-mailwatch-plugin_1.3.0.bb                   | 2 +-
 .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb     | 2 +-
 .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb | 2 +-
 .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb     | 2 +-
 .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb   | 2 +-
 .../pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb                 | 2 +-
 .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.2.bb | 2 +-
 .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
 .../time-out/xfce4-time-out-plugin_1.1.2.bb                     | 2 +-
 .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb     | 2 +-
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb     | 2 +-
 .../weather/xfce4-weather-plugin_0.11.0.bb                      | 2 +-
 .../whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb               | 2 +-
 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
 .../archive/thunar-archive-plugin_0.4.0.bb                      | 2 +-
 .../media-tags/thunar-media-tags-plugin_0.3.0.bb                | 2 +-
 .../recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb | 2 +-
 meta-xfce/recipes-xfce/exo/exo_4.16.3.bb                        | 2 +-
 meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb                  | 2 +-
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb          | 2 +-
 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb      | 2 +-
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb    | 2 +-
 meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb                  | 2 +-
 meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb                | 2 +-
 .../recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb      | 2 +-
 .../recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb      | 2 +-
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb        | 2 +-
 .../xfce4-power-manager/xfce4-power-manager_4.16.0.bb           | 2 +-
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb    | 2 +-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb  | 2 +-
 meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb                  | 2 +-
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb            | 2 +-
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb                    | 2 +-
 65 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
index 853d77e395..6aa5ae8c30 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Catfish is a handy file searching tool for linux and unix"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg
diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
index 517f1f4c50..6b845ea613 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Gigolo is a frontend to easily manage connections to remote filesystems using GIO/GVfs"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
index db9004692b..898f6ed43a 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "An advanced menu editor"
 HOMEPAGE = "https://bluesabre.org/menulibre/"
 SECTION = "x11/graphics"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = " \
diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.8.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.8.bb
index 0f847e4596..90a75bf5a3 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.8.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A simple text editor for Xfce"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+3 gtksourceview4 xfconf xfce4-dev-tools-native"
diff --git a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
index 8277705f4c..ed7f42024e 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce Calender"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "gtk+ xfce4-panel libical popt"
 
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.12.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.12.1.bb
index aeeb7e7659..f2156a3e2a 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.12.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.12.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tiny image-viewer"
 HOMEPAGE = "https://docs.xfce.org/apps/ristretto/start"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
 
 DEPENDS = "exo libexif libxfce4ui libxfce4util xfconf cairo file"
diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index e56824e595..d8f0033b3e 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Lightweight, desktop independent GTK+ archive manager"
 HOMEPAGE = "http://xarchiver.sourceforge.net"
 SECTION = "x11"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
index 58e628deca..3e3301f748 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A simple PolicyKit authentication agent for XFCE"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=758b03f872a88c99fc36d50c5932091c"
 
 DEPENDS = "libxfce4ui polkit"
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index 9d68ad272b..6bcfc4ba43 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A fork of (early) gnome-control-center datetime panel for XFCE. \
 It is based upon GTK3 and embedds into recent xfce4-settings."
 HOMEPAGE = "https://github.com/schnitzeltony/xfce4-datetime-setter"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 DEPENDS = "glib-2.0-native libxfce4ui"
diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb
index a145295b6a..2174d2af4f 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Easily themable notification daemon with transparency effects"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = " \
     dbus \
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
index d5b0cf0bb3..ab1b827266 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Backup, restore, import, and export panel layouts"
 SECTION = "x11/application"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit python3native gettext gtk-icon-cache features_check
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb
index a770ff7f00..685c4c1f65 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Xfce screensaver is a screen saver and locker that aims to have s
 HOMEPAGE = "https://git.xfce.org/apps/xfce4-screensaver/about/"
 SECTION = "x11/application"
 
-LICENSE = "GPLv2+ & LGPLv2+ "
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later "
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     "
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb
index 2518435339..78e0848177 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.9.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Application to take screenshots"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11"
 
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
index e0da70dd0b..a3d10cd256 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Easy to use task manager"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-app
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
index 7e7c4bbbce..ce65c12056 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Terminal emulator for the Xfce desktop environment"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui"
 
diff --git a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
index 78dd5b8743..532980d967 100644
--- a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
+++ b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Rodent-icon-theme (was xfce4-icon-theme) is a svg icon theme"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 inherit allarch autotools gtk-icon-cache
diff --git a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
index 46302bf9f0..4cbdb4e083 100644
--- a/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
+++ b/meta-xfce/recipes-art/xfce-dusk-gtk3/xfce-dusk-gtk3_1.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Modified version of the xfce-dusk theme to support also gtk 3.x too"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 inherit allarch
diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index 4c2e99a22c..272f83c01b 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Additional (old) themes for Xfwm4"
 SECTION = "x11/wm"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index e4a845ca5e..0a65bd94a2 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Xfce4 Vala provides bindings for the Xfce framework"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
 
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
index c94d5e893c..cdf4557cd3 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.3.bb
@@ -7,7 +7,7 @@ This package contains the core DBus services and some utilities."
 HOMEPAGE = "http://code.google.com/p/imsettings/"
 SECTION = "Applications/System"
 
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 inherit autotools gtk-doc gobject-introspection gettext features_check
diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb b/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
index 0b38f6d603..545ab816e1 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Parole is a modern simple media player based on the GStreamer framework"
 HOMEPAGE = "https://docs.xfce.org/apps/parole/start"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-app gtk-doc mime mime-xdg
diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
index 4e3c1d1c36..4a7ed93ebc 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Simple client plugin for Music Player Daemon"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
 SECTION = "x11/application"
-LICENSE = "BSD-0-Clause"
+LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3604d987e6dfdfc672c754d08953b0e0"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
index 8384a5a78e..b8521ba95e 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Music Player Daemon (MPD) client written in GTK+"
 HOMEPAGE = "https://goodies.xfce.org/projects/applications/xfmpc"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libxfce4util libxfce4ui libmpd vala-native"
 
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
index 9e65cf688a..0f8489b18c 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
index 6ed9e35d77..8fd2bd0d29 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A calculator plugin for the Xfce panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-calculator-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
 inherit xfce-panel-plugin gtk-icon-cache
diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
index d5c626eec6..39a8f2edfe 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Clipman is a clipboard manager for Xfce"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index 67f4172228..2384682ecb 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Plugin displaying close button for application currently active"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin xfce-git gtk-icon-cache perlnative
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.5.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.5.bb
index 8fef520271..f3d78c11df 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.5.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin to display frequency of all cpus"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.5.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.5.bb
index ad731e0167..583eacb2bc 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.5.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
index f95995b07c..c029ac1c0f 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin displaying date and time and a calendar when left-clicked"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb
index fce5df5e3e..e18621d813 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-eyes-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
index 9a6d4b19c8..d792bc047b 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "This plugin cyclically spawns the indicated script/program, captures its output (stdout) and displays the resulting string into the panel."
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
index c4172f4d6b..a5c98efc1c 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
index 3f35b8c248..3a6baf21f9 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Mount/umount utility for the xfce panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mount-plugin"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
index b30543b10a..834f5cfaae 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin displaying current load of the network interfaces"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
index cd7212f655..dc0fc2c60e 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Notes plugin for the Xfce Panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
index c88e8439e2..e2075a6d32 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Menu for quick access to folders, documents and removable media"
 DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents and removable media"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
index 9292023cef..b2d61a1d22 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Pulseaudio mixer for the xfce panel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5eac6bb0d6ec0dc655e417781d4015f"
 
 inherit xfce-panel-plugin features_check
diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.2.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.2.bb
index c00ca6fafb..68f3f64295 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Sensors plugin for the Xfce Panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
index 81370e3c11..fdec598190 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin allowing to send requests directly to browser"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
index 185e9bca02..5b7f62471d 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "This plugin makes it possible to take periodical breaks"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
index f154023e2f..1231e084cd 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XFCE panel plugin to generate alarm messages"
 DESCRIPTION = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 5902ad0bd5..21bbda331a 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Verve panel plugin is a comfortable command line plugin for the Xfce panel"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-verve-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
index 069c9150e3..ede98e9926 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin to display current temperature and weather condition"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
index cebe1106c0..6621099cbd 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An alternate menu for the Xfce desktop environment"
 HOMEPAGE = "http://gottcode.org/xfce4-whiskermenu-plugin/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
index ff572362d3..3d935a3d71 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XKB layout switching panel plug-in for the Xfce desktop environment"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
 SECTION = "x11/application"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
index 144e26069e..0a1098db56 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Thunar Archive Plugin allows you to create and extract archive files using file context menus in Thunar"
 HOMEPAGE = "http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 
 inherit thunar-plugin
diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
index a61e7648ed..06695f694c 100644
--- a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Adds ID3/OGG tag support to the Thunar bulk rename dialog"
 HOMEPAGE = "http://thunar.xfce.org"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit thunar-plugin
diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
index de19c44af0..26e96f3612 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Quickly share a folder using Samba from Thunar"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit thunar-plugin features_check
diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
index f27171dc37..2b164442f8 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Application library for the Xfce desktop environment"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
 
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
index 65db345005..a6c56edf3b 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xfce Menu Library"
 SECTION = "x11/libs"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "xfce4-dev-tools-native libxfce4ui intltool-native"
 
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
index 2c6c7424e6..e3d2a00eea 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "intltool-native perl-native gtk+3 libice libsm libxfce4util xfce4-dev-tools xfconf virtual/libx11"
 
diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
index 9462b28ac5..6824ac67e3 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Basic utility library for Xfce4"
 SECTION = "x11/libs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
index 5c669a5e95..e529bc80c9 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo libnotify libgudev"
 
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
index 0872110f80..93c41aedfe 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
@@ -1,6 +1,6 @@
 SUMMARY = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libsm startup-notification libnotify xfce4-panel udev"
 
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
index c5ab85dd08..6a583ade73 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Thumbnail service implementing the thumbnail management D-Bus specification"
 SECTION = "x11/libs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgsf"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
index 89385b0569..18d9fedfce 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xfce4 Application Finder"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
index 7162311e56..5c41a76ed6 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Xfce4 development tools"
 HOMEPAGE = "http://www.xfce.org"
 SECTION = "x11/libs"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
 DEPENDS = "glib-2.0"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
index 02038b0c12..b9201bc655 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce4 Panel"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala-native"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
index a79d8015b6..34de7a7086 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Power manager for the Xfce desktop environment"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
 SECTION = "x11"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce features_check
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
index fee634ed44..e6613b8ee9 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
 SECTION = "x11"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
 DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aff57a5788..83b624f120 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce4 settings"
 SECTION = "x11/wm"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
 
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
index 0bbef847ce..be742192b1 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
index 7136350413..b0dc8e1762 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libxfce4ui libwnck thunar garcon exo"
 
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
index f4a78f1adf..a32bad47ed 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xfce4 Window Manager"
 SECTION = "x11/wm"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama"
 
-- 
2.35.1


