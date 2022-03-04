Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416BEC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:26 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.5026.1646383825560111622
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Un1xgKbB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id m22so6866987pja.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aYeZoXcaSz7PPxCXEw+8waqzoz+N6ikrJhq9Eoz8VAI=;
        b=Un1xgKbB2L3xDa7ypd9mCjGvrpH2jkitxcwkaFOSpXTxcik1MX1UPBzYo9rQ6UreOT
         nuoOu+3BBxIs3oTnu1mgx/yOV3K005GFoJ0cG7YRM8/STfHZtJbUYiGpxlhoaxa97mRn
         u7t59NCxG3jz8mWH+gslh43wpo1SqblzMiufoQDfOogLeiLo2u4ZcgkrF45CWkv3TgKa
         SEzK2mgQdXq/JhN3vCeU7VkW1twQOArc6VpIYU2a+USwDkLGH8IYyrFVhHLaK8z4q2j2
         kkr1TIfBcJAoMQbEfejjJjGehSYYnNJNeEC4A0ex7CFFJ35v0MS00kCPO12ls+UqThql
         ATpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aYeZoXcaSz7PPxCXEw+8waqzoz+N6ikrJhq9Eoz8VAI=;
        b=gbr/J/u4TEbENBru3jC0kx57U19BXCHcRjw4ofH0n5N4wKLD3OV6kRgOdLZ9oDTqDr
         BnaCAGyUaiAyXVgEe6aYe1G8XxzZPRUd9qf7fM+ogxaGY8iuotoLZfaiYQiX1RAoeDA6
         7qA2xkVQ7P1NN7TyvknxCPgMotaTfhLl+7tTu/Ek1Trwj9OecNyh0Vprta8xCijc8sFS
         w5fI887yCoZH2k49km1N7cEwPTD009HeZMzWP0wp12S8pBHbZUKMsrLyv5bKXuZ4hFfx
         Yco5hSNKJCBx6BueOxShQ+ayKUapnJyoBFUt6B+jzLOtZmMUliKYIFNEA/xlno5Mfsj1
         nrYQ==
X-Gm-Message-State: AOAM532z8FKQ1TFHQtUV9LmTuncvF2WR7+cbL7mKUXSOZ6AJi+JMEe/m
	4A8FB0H85ici+GFTkNs/dO3khFl2lP5UHg==
X-Google-Smtp-Source: 
 ABdhPJwhEFU9maLIzTEY465EWt9JH0xLnpo1GcTIcjYYCCpJW7iFOmg5IxvYkX5fzbqG/26dhwABTg==
X-Received: by 2002:a17:902:6ac4:b0:149:907d:afdc with SMTP id
 i4-20020a1709026ac400b00149907dafdcmr40320018plt.59.1646383823890;
        Fri, 04 Mar 2022 00:50:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 03/10] recipes: Update LICENSE variable to use
 SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:11 -0800
Message-Id: <20220304085018.1255075-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95771

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb           | 2 +-
 meta-gnome/recipes-connectivity/geary/geary_40.0.bb             | 2 +-
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb         | 2 +-
 .../network-manager-applet/network-manager-applet_1.24.0.bb     | 2 +-
 meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb            | 2 +-
 meta-gnome/recipes-gimp/babl/babl_0.1.90.bb                     | 2 +-
 meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb                     | 2 +-
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb                    | 2 +-
 meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb                     | 2 +-
 meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb           | 2 +-
 meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb                  | 2 +-
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb           | 2 +-
 meta-gnome/recipes-gnome/evince/evince_41.3.bb                  | 2 +-
 .../evolution-data-server/evolution-data-server.inc             | 2 +-
 .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb    | 2 +-
 meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb      | 2 +-
 meta-gnome/recipes-gnome/gdm/gdm_41.0.bb                        | 2 +-
 meta-gnome/recipes-gnome/gedit/gedit_41.0.bb                    | 2 +-
 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb    | 2 +-
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb                | 2 +-
 meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb             | 2 +-
 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb                    | 2 +-
 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb     | 2 +-
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb     | 2 +-
 .../recipes-gnome/gnome-calculator/gnome-calculator_41.1.bb     | 2 +-
 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb  | 2 +-
 .../gnome-control-center/gnome-control-center_41.2.bb           | 2 +-
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb    | 2 +-
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb | 2 +-
 .../recipes-gnome/gnome-flashback/gnome-flashback_3.42.1.bb     | 2 +-
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb   | 2 +-
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb    | 2 +-
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb      | 2 +-
 .../gnome-online-accounts/gnome-online-accounts_3.43.1.bb       | 2 +-
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.42.0.bb      | 2 +-
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb      | 2 +-
 .../recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb     | 2 +-
 meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb    | 2 +-
 .../gnome-settings-daemon/gnome-settings-daemon_41.0.bb         | 2 +-
 .../recipes-gnome/gnome-shell/gnome-shell-extensions_41.1.bb    | 2 +-
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb        | 2 +-
 .../gnome-system-monitor/gnome-system-monitor_41.0.bb           | 2 +-
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb       | 2 +-
 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb      | 2 +-
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb          | 2 +-
 meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb                  | 2 +-
 meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb                 | 2 +-
 meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb                 | 2 +-
 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb                | 2 +-
 .../gtksourceview/gtksourceview-classic-light_1.0.bb            | 2 +-
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb       | 2 +-
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb  | 2 +-
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.2.0.bb  | 2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb                    | 2 +-
 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb   | 2 +-
 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb            | 2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb               | 2 +-
 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb              | 2 +-
 meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb        | 2 +-
 meta-gnome/recipes-gnome/libportal/libportal_0.5.bb             | 2 +-
 meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb | 2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb               | 2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb              | 2 +-
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb         | 2 +-
 meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb            | 2 +-
 meta-gnome/recipes-gnome/mutter/mutter_41.2.bb                  | 2 +-
 meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb              | 2 +-
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb                     | 2 +-
 meta-gnome/recipes-gnome/sysprof/sysprof_3.42.1.bb              | 2 +-
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb        | 2 +-
 meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb               | 2 +-
 meta-gnome/recipes-gnome/yelp/yelp-tools_41.0.bb                | 2 +-
 meta-gnome/recipes-gnome/yelp/yelp-xsl_41.1.bb                  | 2 +-
 meta-gnome/recipes-gnome/yelp/yelp_41.2.bb                      | 2 +-
 meta-gnome/recipes-graphics/clutter/clutter-1.0.inc             | 2 +-
 meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc         | 2 +-
 meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc         | 2 +-
 .../recipes-support/accountsservice/accountsservice_0.6.55.bb   | 2 +-
 .../recipes-support/appstream-glib/appstream-glib_0.7.18.bb     | 2 +-
 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb       | 2 +-
 meta-gnome/recipes-support/ibus/ibus.inc                        | 2 +-
 meta-gnome/recipes-support/libuser/libuser_0.62.bb              | 2 +-
 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb             | 2 +-
 meta-gnome/recipes-support/usermode/usermode_1.114.bb           | 2 +-
 84 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
index c3c30ca467..14e74cd0a2 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Folks is a contact aggregation library."
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index b3b4311320..5821122759 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Geary is an email application built around conversations, for the GNOME 3 desktop."
 SECTION = "network"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a2244d5a13871ad950c55877546a6a2"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb
index 311492eea3..ea852ce3a0 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb
@@ -1,5 +1,5 @@
 SUMMARY = "NetworkManager GUI library"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0 gtk+3 networkmanager"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
index c181d3943e..c0667b5bb1 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GTK+ applet for NetworkManager"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes nss"
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
index 355bcce9b6..d1a9759303 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A partition editor to graphically manage disk partitions "
 HOMEPAGE = "http://gparted.org/index.php"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit features_check autotools pkgconfig python3native gnome-help gtk-icon-cache
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
index cf10a5ce80..0d2ac527a0 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
index d7595b7c9a..a6e5fa0300 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1a8bfcbc85304df454b65d378b299c7"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 5081583d63..36448b8f76 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The GIMP is the GNU Image Manipulation Program"
 HOMEPAGE = "http://www.gimp.org"
 SECTION = "x11/graphics"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb b/meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb
index d4d91ed51a..f6d8739dae 100644
--- a/meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb
+++ b/meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Actions, Menus and Toolbars Kit"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
index 55b29139bb..ef26caa144 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Configuration editor for dconf"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
index 5613556aa7..6641be86ee 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "configuation database system"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
index 8e048170bc..01900cce39 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Devilspie2 is a window matching utility, allowing the user to perform scripted actions on windows as they are created"
 HOMEPAGE = "http://www.gusnan.se/devilspie2"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
                     file://GPL3.txt;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta-gnome/recipes-gnome/evince/evince_41.3.bb b/meta-gnome/recipes-gnome/evince/evince_41.3.bb
index ec3dca209d..2dc0aeaa82 100644
--- a/meta-gnome/recipes-gnome/evince/evince_41.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_41.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 96367aa0c6..d22310f7ec 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -2,7 +2,7 @@ SUMMARY = "Evolution database backend server"
 HOMEPAGE = "http://www.gnome.org/projects/evolution/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "LGPLv2 & LGPLv2+"
+LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
                     file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543"
diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index 55fdba5e38..5ed3375eb0 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "An icon theme for Gnome"
 SECTION = "x11/wm"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 HOMEPAGE = "http://code.google.com/p/faenza-icon-theme/"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb
index ccc82aec45..cce7f211f7 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An archive manager utility for the  GNOME Environment"
-LICENSE="GPLv2"
+LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
index e31ca13f0f..94ffdc28eb 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Display Manager"
-LICENSE="GPLv2"
+LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
index 8c11fb52e0..b8d686fa50 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME editor"
 SECTION = "x11/gnome"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
index c0f3c27af4..df401f7291 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A convenience library for the geocoding"
 
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
index b2fd4b0316..afec302cb4 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A GObject-based Exiv2 wrapper"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "exiv2 python3-pygobject-native"
diff --git a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
index 23b3bf63a5..b64b231b50 100644
--- a/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
+++ b/meta-gnome/recipes-gnome/gfbgraph/gfbgraph_0.2.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A GObject library for Facebook Graph API"
 SECTION = "x11/gnome"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5804fe91d3294da4ac47c02b454bbc8a"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
index 438f8113a6..08e50409eb 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GHex - a hex editor for GNOME"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
index 0015e9f05b..017d67b5a6 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME archive library"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
index 8eed262998..57fe74495d 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME bluetooth manager"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_41.1.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_41.1.bb
index f4aba65953..607f52afeb 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_41.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_41.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME calculator"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SECTION = "x11/gnome"
diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb
index 4b62a0c07c..c97bf0bec8 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_41.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME calendar"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 SECTION = "x11/gnome"
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb
index f2b95edd06..1cdc96ba0b 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_41.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME Settings"
 DESCRIPTION = "GNOME Settings is GNOME's main interface for configuration of various aspects of your desktop"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb
index 3085d2767e..6bf2ab3986 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
index 7e254f52c7..a7945dd3e4 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME disk utility"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SECTION = "x11/gnome"
diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.42.1.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.42.1.bb
index 3f47de6f29..13a68e3c80 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.42.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Flashback (GNOME 2) session"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit gnomebase gsettings gtk-icon-cache gettext upstream-version-is-even features_check
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb
index 9528b6641c..2e2927f1c7 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_41.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME font viewer"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SECTION = "x11/gnome"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
index 5bc5f2e0fb..5aa52d1a50 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome"
 
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
index c58229879c..dbc6e962eb 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME menus"
 SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.43.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.43.1.bb
index 3dca7e37a8..8dabb9e0c1 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.43.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Online Accounts - Single sign-on framework for GNOME"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36"
 
 GNOMEBASEBUILDCLASS = "autotools"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.42.0.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.42.0.bb
index 9c9add4f48..2bcf145471 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.42.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME flashback panel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc gettext upstream-version-is-even features_check
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
index ae8ab31f64..52f5154ac9 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Access, organize and share your photos on GNOME"
 SECTION = "x11/gnome"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
index 18d73d872a..fa7e161e9e 100644
--- a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GNOME Screenshot"
 DESCRIPTION = "GNOME Screenshot is a small utility that takes a screenshot \
 of the whole desktop, the currently focused window, or an area of the screen."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SECTION = "x11/gnome"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb
index 010f815cdd..07f3634294 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME session"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
index 78d6811700..cbc4c460c1 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_41.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_41.1.bb
index db1c0a5797..f51ca9f918 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_41.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_41.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Shell Extensions"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb
index d1b19895ae..8d0dba4840 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Shell is the graphical shell of the GNOME desktop environment"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb
index 9b573d0ff0..c0b4b39375 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_41.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Gnome system monitor"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
index 2b3f3a6162..061da27f60 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME terminal"
-LICENSE = "GPLv3 & GFDL-1.3"
+LICENSE = "GPL-3.0-only & GFDL-1.3"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
     file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0 \
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
index c816fc209a..ffdf2c9d38 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME tweaks: Advanced options for GNOME 3 session"
-LICENSE = "GPLv3 & CC0-1.0"
+LICENSE = "GPL-3.0-only & CC0-1.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSES/CC0-1.0;md5=65d3616852dbf7b1a6d4b53b00626032 \
     file://LICENSES/GPL-3.0;md5=9eef91148a9b14ec7f9df333daebc746 \
diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb
index 028e1d22b7..d00e737f4a 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.14.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Grilo is a framework forsearching media content from various sources"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb
index 53d80c5cbe..7ceb26d7a2 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Grilo is a framework forsearching media content from various sources"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
index 7c7925420c..bdef603f0d 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Small gobject library for playing system sounds"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=447b837ae57f08b7060593ac6256163f"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
index aba9be87aa..15f1cadbab 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "gspell adds spell-checking to a GTK+ applications"
 HOMEPAGE = "https://wiki.gnome.org/Projects/gspell"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8c2e1ec1540fb3e0beb68361344cba7e"
 
 DEPENDS = "gtk+3 iso-codes enchant2"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb
index e9c52f3470..1459e0b434 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Image viewer and browser"
-LICENSE="GPLv2"
+LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
index 64d5b868f7..4e1e434314 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Gtksourceview Classic-Light theme"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://classic-light.xml;beginline=6;endline=23;md5=2b4f75364fad00a4d752214dcbd7d7c3"
 
 inherit allarch
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index 9f88513f7d..1e5652d3bd 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Portable C library for multiline text editing"
 HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = "gtk+3 libxml2 intltool-native gnome-common-native glib-2.0-native"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
index 5b5ce5328a..db4d89de22 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Portable C library for multiline text editing"
 HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = "gtk+3 libxml2 intltool-native gnome-common-native glib-2.0-native"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.2.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.2.0.bb
index c7c6e92037..00487743e8 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.2.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.2.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Portable C library for multiline text editing"
 HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
index c73716d749..9df054d3b5 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "gvfs is a userspace virtual filesystem"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
index 51ca63e1fb..859eab9164 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
@@ -1,5 +1,5 @@
 SUMMARY = "libchamplain is a Gtk widget displaying zoomable and pannable maps"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
 
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index a1be2a2b64..921c3ee805 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "GLib-based library for accessing online service APIs using the GData
 HOMEPAGE = "http://live.gnome.org/libgdata"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb
index a3ff13f9ba..22599f599e 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.48.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Structured File Library"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 6d9398f4e4..3ee7746c10 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A library for collecting system monitoring data"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
index 49493b17b2..771fc62e1e 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library to access weather information from online services"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb b/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb
index 67f63fea68..6deac38fda 100644
--- a/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb
+++ b/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals
 with a familiar GObject API along side the D-Bus API"
 HOMEPAGE = "https://github.com/flatpak/libportal"
 BUGTRACKER = "https://github.com/flatpak/libportal/issues"
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index c74e1d4388..d633b0621d 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Time zone map widget for Gtk+"
 HOMEPAGE = "https://launchpad.net/timezonemap"
 SECTION = "devel/lib"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
index 6c9e631e11..cb4e459b3d 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 BPN = "libwnck"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index d1f36a94d2..3abba94990 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/libs"
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
index e47d74b7b8..7955663f26 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helper lib for keyboard management"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
index 58479cf7b3..8baf2bc62b 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
@@ -1,6 +1,6 @@
 SECTION = "x11/wm"
 SUMMARY = "Metacity is the boring window manager for the adult in you"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b4cce53560b8e619ffa7c830fb8761aa \
                     file://src/include/main.h;endline=24;md5=72148ede07a6dadd01de6a882d20a9ad"
 
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_41.2.bb b/meta-gnome/recipes-gnome/mutter/mutter_41.2.bb
index 19dad21380..08ac897a7f 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_41.2.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_41.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Window and compositing manager based on Clutter"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
index e9541a7150..66043fad34 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "File manager for GNOME"
 SECTION = "x11/gnome"
 
-LICENSE="GPLv3"
+LICENSE="GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
index 545224a99e..f1c9915c09 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "library to access web services that claim to be "RESTful""
 HOMEPAGE = "https://wiki.gnome.org/Projects/Librest"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 GNOMEBASEBUILDCLASS = "autotools"
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.1.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.1.bb
index 3dd08a29cd..99b3c60fa5 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.1.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "System-wide Performance Profiler for Linux"
 HOMEPAGE = "http://www.sysprof.com"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
index 44b3671122..2847635b6d 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tracker miners and metadata extractors"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
index 1c18efbcef..f81a84cd31 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tracker is a file search engine"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=ee31012bf90e7b8c108c69f197f3e3a4 \
     file://COPYING.LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_41.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_41.0.bb
index ec8edb80d3..13dada4438 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_41.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_41.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Collection of scripts and build utilities for documentation"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=d67c6f9f1515506abfea4f0d920c0774 \
     file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_41.1.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_41.1.bb
index 3b23979780..50cc8fc3a7 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_41.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_41.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "XSL stylesheets for the yelp help browser"
-LICENSE = "LGPLv2.1 & GPLv2 & BSD-3-Clause"
+LICENSE = "LGPL-2.1-only & GPL-2.0-only & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=8ca13a5a6972ac1620a1e42a3dacd774 \
     file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
diff --git a/meta-gnome/recipes-gnome/yelp/yelp_41.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_41.2.bb
index 590ff2f548..01427b157d 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_41.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_41.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Help browser for the GNOME desktop"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
 "
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc b/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
index b91bc30488..ce6b8a0f49 100644
--- a/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Clutter is an Open GL based interactive canvas library, \
 designed for creating fast, mainly 2D single window applications such as media \
 box UIs, presentations, kiosk style applications and so on."
 HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 
 inherit clutter ptest-gnome features_check upstream-version-is-even gobject-introspection
 # depends on cogl-1.0 which needs opengl
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
index 8c6d0b3a07..7880021755 100644
--- a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -4,7 +4,7 @@ It provides a GStreamer sink to upload frames to GL and an actor that \
 implements the ClutterGstPlayer interface using playbin."
 HOMEPAGE = "http://www.clutter-project.org/"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/clutter-gst/-/issues"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 
 inherit clutter features_check upstream-version-is-even gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 9a28b5219b..025e95b5d4 100644
--- a/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -5,7 +5,7 @@ a Clutter stage into any GtkContainer; and GtkClutterActor, a Clutter \
 actor for embedding any GtkWidget inside a Clutter stage."
 HOMEPAGE = "http://www.clutter-project.org/"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/clutter/-/issues"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 
 CLUTTERBASEBUILDCLASS = "meson"
 inherit clutter features_check upstream-version-is-even gobject-introspection gtk-doc
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
index 26cc04b8e2..551ff5dc9d 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "D-Bus interfaces for querying and manipulating user account information"
 HOMEPAGE = "https://www.freedesktop.org/wiki/Software/AccountsService/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
index 3488fb568c..45a28ed967 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Objects and helper methods to help reading and writing AppStream metadata"
 HOMEPAGE = "https://people.freedesktop.org/~hughsient/appstream-glib/index.htm"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
index 2b09adf710..e9c79e28b2 100644
--- a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GTK support library for colord"
 HOMEPAGE = "https://www.freedesktop.org/software/colord/"
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 inherit meson gobject-introspection gettext gtk-doc features_check
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 01f05c1b69..23f565f661 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Intelligent Input Bus for Linux/Unix"
 HOMEPAGE = "https://github.com/ibus/ibus/wiki"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
diff --git a/meta-gnome/recipes-support/libuser/libuser_0.62.bb b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
index 722b647f21..22ddd10a63 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.62.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
@@ -4,7 +4,7 @@ and group accounts"
 HOMEPAGE = "https://pagure.io/libuser"
 BUGTRACKER = "https://pagure.io/libuser/issues"
 
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://lib/user.h;endline=19;md5=76b301f63c39fa992062395efbdc9558 \
                     file://samples/testuser.c;endline=19;md5=3b87fa660fa3f4a6bb31d624afe30ba1"
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index 775e7c3c7a..9325ef9c25 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An onscreen keyboard"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
 
 DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutils-extra-native intltool-native"
diff --git a/meta-gnome/recipes-support/usermode/usermode_1.114.bb b/meta-gnome/recipes-support/usermode/usermode_1.114.bb
index 478d8fa9b5..1811b2d3c4 100644
--- a/meta-gnome/recipes-support/usermode/usermode_1.114.bb
+++ b/meta-gnome/recipes-support/usermode/usermode_1.114.bb
@@ -7,7 +7,7 @@ graphical tools for users: \
 * userpasswd allows users to change their passwords. \
 "
 HOMEPAGE = "https://pagure.io/usermode"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "libuser ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
-- 
2.35.1


