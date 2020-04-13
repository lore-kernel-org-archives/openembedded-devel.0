Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.1842.1586814316260701262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 14:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gs5F0nNl;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id w3so3890043plz.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2020 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6CnpeXy0sog8UfRB6U5YVJ7CrOD3AUKsnrx6c6WeNO0=;
        b=Gs5F0nNlGADkx2i3TZ5vePzGA7rv+iBqld9+WlsMm8DItnCPXVvwkCzNqQ2RvfE9ev
         4Y/2P6dCxt73Z4Y5xITQ4XCtC0yh/2Hw9pckaugBk6/NwguQp7pmAsLryQeDXcPoeSqc
         LZTbKRqrEu2q83IgDdddnhrlbykj7ormDjEqYSd75Zuos0sY+5ZnxBzjWZSw0TWwo+H3
         sNmZtftIez2/9PtHpKQMEv5QcUF9LtVCJjmiwChPrJ+5gXdlaUZLcScY+q6vrtYdIb1M
         Ql2norwONXXBVph/uZ/SQzlJwqvlUa5NJ/oXaLdAJWO8/FgKLaAZXEkEthYKBJqdR5Hy
         Enig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6CnpeXy0sog8UfRB6U5YVJ7CrOD3AUKsnrx6c6WeNO0=;
        b=aqTvVqmA3tDZCpTJ2dBvPfJt7a7OIAMP4nowqZV7W1CrW4xRa4BrE8a2QEYECavH1v
         aYCdQQ2DEnKSMpWr1Ap4h56E9Vp905gJBCQTzG4PWQu9kXjYfm9P+AVkGlIggiv4bJ22
         jc60zZ12iwg7kNeSPaxgvk4bKLPGZrbGu9PJGBuJv6IM1D4DK/OF84yZHakLzDuGofK6
         mx8HpRWfYeft9Y9SXm+OOHwb8U66t64h/BnicxYL6Q6e8OX9N+LVz4gy5TkeYwxjt1gK
         cpK15Uc5vTJKIi5CeXTx7wbRbCdhfjiqBcTOry0eL71uc2wWne9iExXqSrOTKRTqQnBa
         +l4g==
X-Gm-Message-State: AGi0PubnSpI4KmoxomEiLVk70aJVIYvt6ZuosyOGLldPjh+CZmlWyTwE
	16ZXE/ta9370WxOwXaKr/T+hmlgQVD8=
X-Google-Smtp-Source: APiQypLUBbbEkSdiokfCGUqr+JlaLbeF12CYb+FLJArkuFYfbyR8ZUUCU9+Wgd5GYl+QFi5nuiIdqw==
X-Received: by 2002:a17:90a:898d:: with SMTP id v13mr25115931pjn.12.1586814315197;
        Mon, 13 Apr 2020 14:45:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id s15sm6650165pfh.17.2020.04.13.14.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:45:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] libcanberra: Do not assume all gdk displays to be X11
Date: Mon, 13 Apr 2020 14:45:11 -0700
Message-Id: <20200413214513.1793854-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-all-GdkDisplays-are-GdkX11Displays-.patch | 63 +++++++++++++++++++
 .../libcanberra/libcanberra_0.30.bb           |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch

diff --git a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch b/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch
new file mode 100644
index 0000000000..ba6fa2c643
--- /dev/null
+++ b/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch
@@ -0,0 +1,63 @@
+From c0620e432650e81062c1967cc669829dbd29b310 Mon Sep 17 00:00:00 2001
+From: Michael Meeks <michael.meeks@suse.com>
+Date: Fri, 9 Nov 2012 16:16:40 +0000
+Subject: [PATCH] gtk: Don't assume all GdkDisplays are GdkX11Displays:
+ broadway/wayland
+
+---
+ src/canberra-gtk-module.c | 15 +++++++++++++++
+ src/canberra-gtk.c        |  5 +++++
+ 2 files changed, 20 insertions(+)
+
+--- a/src/canberra-gtk-module.c
++++ b/src/canberra-gtk-module.c
+@@ -307,6 +307,11 @@ static gint window_get_desktop(GdkDispla
+         guchar *data = NULL;
+         gint ret = -1;
+ 
++#ifdef GDK_IS_X11_DISPLAY
++        if (!GDK_IS_X11_DISPLAY(d))
++                return 0;
++#endif
++
+         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d), GDK_WINDOW_XID(w),
+                                gdk_x11_get_xatom_by_name_for_display(d, "_NET_WM_DESKTOP"),
+                                0, G_MAXLONG, False, XA_CARDINAL, &type_return,
+@@ -335,6 +340,11 @@ static gint display_get_desktop(GdkDispl
+         guchar *data = NULL;
+         gint ret = -1;
+ 
++#ifdef GDK_IS_X11_DISPLAY
++        if (!GDK_IS_X11_DISPLAY(d))
++                return 0;
++#endif
++
+         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d), DefaultRootWindow(GDK_DISPLAY_XDISPLAY(d)),
+                                gdk_x11_get_xatom_by_name_for_display(d, "_NET_CURRENT_DESKTOP"),
+                                0, G_MAXLONG, False, XA_CARDINAL, &type_return,
+@@ -365,6 +375,11 @@ static gboolean window_is_xembed(GdkDisp
+         gboolean ret = FALSE;
+         Atom xembed;
+ 
++#ifdef GDK_IS_X11_DISPLAY
++        if (!GDK_IS_X11_DISPLAY(d))
++                return FALSE;
++#endif
++
+         /* Gnome Panel applets are XEMBED windows. We need to make sure we
+          * ignore them */
+ 
+--- a/src/canberra-gtk.c
++++ b/src/canberra-gtk.c
+@@ -185,6 +185,11 @@ static gint window_get_desktop(GdkDispla
+         guchar *data = NULL;
+         gint ret = -1;
+ 
++#ifdef GDK_IS_X11_DISPLAY
++        if (!GDK_IS_X11_DISPLAY(d))
++                return 0;
++#endif
++
+         if (XGetWindowProperty(GDK_DISPLAY_XDISPLAY(d), GDK_WINDOW_XID(w),
+                                gdk_x11_get_xatom_by_name_for_display(d, "_NET_WM_DESKTOP"),
+                                0, G_MAXLONG, False, XA_CARDINAL, &type_return,
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 72c93abe17..1495051d79 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -11,6 +11,7 @@ inherit autotools gtk-doc
 SRC_URI = " \
     http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
     file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
+    file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch \
 "
 SRC_URI[md5sum] = "34cb7e4430afaf6f447c4ebdb9b42072"
 SRC_URI[sha256sum] = "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
-- 
2.26.0

