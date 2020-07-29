Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web12.1693.1596010251368426306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 01:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=YfVxAypt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id t6so11108815ljk.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UuBzcvLdr4ELoPH2G6MvXOmqPSBuiMm7BQeY06XNB74=;
        b=YfVxAyptAHjhHITODNQ5GsosFU+gtPTYyhI/j/zT6roewV5upTxJC7Mt28zDDof7iC
         NN9pnzKdnQKm9tKf4BZHl5PgUK6dRO/QBcFYcyHr7tBDbuZi5q0dqRnBkg1A+07ombgd
         yIPYUskdewR14H1ozH1PmAt/dJCvAo1RezbpHqI1EloH3CZI7eYMC7wqfjHCSZrS4lfi
         Ko3ANxZuL7uzll1MyK1QKkOC3YNN6eHlMgC53btF6w2xYa+olEzvENy0YAlYfgAfPxIA
         O6hpGA4ZezxOHsz5r3hvbWPH1iz/rUjtfwdBk3mTsn7Trf2VmhYzMWGWgDyU9QlRzuEy
         Y/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UuBzcvLdr4ELoPH2G6MvXOmqPSBuiMm7BQeY06XNB74=;
        b=JVIPRwAMcYbcuWlehYkXEPG+H7sL5HhYIwAorGa12Oc3wt5tm/obY9DQYKJGEcolE2
         b2e0prm5mEIdYmNvIn6qrCgU+gjcCwRvXUZUvXXVfYUmEIbqmzccGzmmk1QBepGBQzir
         hn+GQ25WGOdC9uE8vWOBG0kl1N6XvyPLwVxxrl0r17Kncl/LuVt2bngykcp5/qzT2p3n
         JQm5VpPXig0n/dBDLUK+neyNRiGeFSitWR+rvTPj41KkiGfmPGCUik/6SWrtCpFstpbK
         ob3DHbhclnE1IuiWs7XZR5CR7JRHZJOD8fIhhAEb0yKN3KRwiXKG+rl5FHZ89PSJF3bT
         5//A==
X-Gm-Message-State: AOAM531YUtZSWwEwhe+FaxTsUwDT4A6mupMWmhcWd9PH5tHq6QkIyu0h
	ntbtF+XUmqyeA0ZY0in2PNO/r1jCXag=
X-Google-Smtp-Source: ABdhPJydWP2NL6lzTKwSfpXWmr28Z+t1AlcTiE+1x5vrFa+ps9GF7L7NVNHbzHaEvUEHuSe+GMIngg==
X-Received: by 2002:a2e:8085:: with SMTP id i5mr14353838ljg.97.1596010249331;
        Wed, 29 Jul 2020 01:10:49 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z15sm345837lfg.81.2020.07.29.01.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:10:48 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] libpeas: update to 1.26.0
Date: Wed, 29 Jul 2020 10:10:46 +0200
Message-Id: <20200729081046.2701969-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libpeas/add_missing_locale_include.patch  | 21 +++++++++++++++++++
 .../{libpeas_1.25.3.bb => libpeas_1.26.0.bb}  |  8 +++++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.25.3.bb => libpeas_1.26.0.bb} (75%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch b/meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch
new file mode 100644
index 000000000..664693128
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch
@@ -0,0 +1,21 @@
+From 3cc69f1eaa86163c3816265fa64cb660f4def364 Mon Sep 17 00:00:00 2001
+From: Christian Hergert <chergert@redhat.com>
+Date: Fri, 13 Mar 2020 10:32:21 -0700
+Subject: [PATCH] demo: add missing locale.h include
+
+Fixes #39
+
+Upstream-Status: backport
+
+diff --git a/peas-demo/peas-demo.c b/peas-demo/peas-demo.c
+index 47ac005..466a392 100644
+--- a/peas-demo/peas-demo.c
++++ b/peas-demo/peas-demo.c
+@@ -26,6 +26,7 @@
+ #include <girepository.h>
+ #include <glib/gi18n.h>
+ #include <gtk/gtk.h>
++#include <locale.h>
+ 
+ #include <libpeas/peas.h>
+ #include <libpeas-gtk/peas-gtk.h>
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
similarity index 75%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
index 57419a427..0c600141f 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.25.3.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
@@ -10,8 +10,12 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
 
-SRC_URI[archive.md5sum] = "08bfff8f9688cf630dcb0f950617661f"
-SRC_URI[archive.sha256sum] = "1c9bbb29740c29cd6e1dd0c9964722ff08cd5e6f68f1b5c135bc391a6ce97639"
+SRC_URI += " \
+    file://add_missing_locale_include.patch \
+"
+
+SRC_URI[archive.md5sum] = "f7723bf8433b7984121157e1e9a629b5"
+SRC_URI[archive.sha256sum] = "a976d77e20496479a8e955e6a38fb0e5c5de89cf64d9f44e75c2213ee14f7376"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.25.1

