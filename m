Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.48663.1591047933114433709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GtB+L9rV;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e1so1319922wrt.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JNM6lB4bTPy5rvnbA7eeFeyM5aRGm1AGKnxGfpct7qc=;
        b=GtB+L9rVPKu4UpxI0oP5PgZ+7lVEx78bhuK5UlXQvyobTIhGa9UtXD7Ch1kl5KYUOq
         9gtYh81Rt/gdq/4DTpStO83bQmpfAIazNfK/23wHrcrzXdfaAFNF6byedod3ulwrPBM/
         CXnG91ULF6NALe1bBP3OA/BTR7e1eu8dIYJt7xsVTKT/uZCdVGoIjmkTfmpkZMW1Nw2c
         zMX+AR9QWonyXo90x5lsWeC2pDHKyzu//u+MpqfwOOCmRuXeCsvqrX7UnpDS279yEHgG
         vswko8HV+NY5NUsDfIVlOqVgZz6x31qTadsnHAh17accmpBQu3KzBzPJhFskV4iJQ8fa
         96/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JNM6lB4bTPy5rvnbA7eeFeyM5aRGm1AGKnxGfpct7qc=;
        b=sh8kGpKinLjozaKNnqWKEmXdlCuFW0K5T8+YXt1hNXM65Hudf6NF7M8P7lIjAgVg5t
         SOm5LyPpUiL6SvmIVLj1hR732ghTW9HlvGUmqAdiJ/Ogv+FhXM7Uqu3fmE/hhmPlneOl
         2jOdDVY41dqo8nEjJIgF0+vGHhIDV6L8A2zBbr8TYFrKjhfuK4A/bqRnSqyDuzZxpzTW
         05VRuNbwHOA6pGKlGZ2ipA1JmJrjn6IFgfZJbZ60yrKUzFSydC267IEhIWtPq/mIhfG/
         1nNM59C81pldWbXfE0FCVKOGWjJOVMJ8fygKBTqkXmr78Y4xI4Bs348mivotyM2v3pDD
         9huA==
X-Gm-Message-State: AOAM532Djh8e7BiFrbZyxQbiz1W2KfateWtDesxi0sdlmBNcip3zO1Er
	wfB/1FCkaip2hIpzzRLOOzv1Qs/v5xk=
X-Google-Smtp-Source: ABdhPJzqfCvNnqZXYPkYIZZOEF3Q+avbxyZ6xJzS9VtVuioRDDOhEw8NdsChvUH7CqOjCkGBLaYfjg==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr23119513wrt.8.1591047931415;
        Mon, 01 Jun 2020 14:45:31 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:30 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/38] gnome-photos: initial add 3.34.2
Date: Mon,  1 Jun 2020 23:44:41 +0200
Message-Id: <20200601214516.26624-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-photos/gnome-photos_3.34.2.bb       | 36 +++++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb
new file mode 100644
index 000000000..bb70ae7a8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Access, organize and share your photos on GNOME"
+SECTION = "x11/gnome"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+DEPENDS = " \
+    glib-2.0-native \
+    gdk-pixbuf-native \
+    librsvg-native \
+    gtk+3 \
+    babl \
+    gegl \
+    geocode-glib \
+    gnome-online-accounts \
+    grilo \
+    gsettings-desktop-schemas \
+    libdazzle \
+    libgdata \
+    gfbgraph \
+    tracker \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext upstream-version-is-even gnome-help features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "1dd0d477eac4707e8cfe9f35e26d1f29"
+SRC_URI[archive.sha256sum] = "3c59c76ef28618ec055a1799d1040287b90a0b021feb0a02b1eac28e9c2eb41a"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+    ${datadir}/gnome-shell \
+"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 0b900f0e7..934101f9b 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -14,6 +14,7 @@ RDEPENDS_${PN} = " \
     ghex \
     gnome-calculator \
     gnome-font-viewer \
+    gnome-photos \
     gnome-terminal \
     libwnck3 \
     nautilus \
-- 
2.21.3

