Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.23757.1591978587045612620
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 09:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/3x/HE/;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id y20so8824520wmi.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Jyv2J8GskJGMGjx+w0SPcnYzz6laErbusqQ09GwF5TU=;
        b=C/3x/HE/qfNRyL2c+UI5oYFOBu1qMh4sNXPaH6u7GaYa1FMgZXrkJrrKtf3rvhvxLh
         z1I9y57vg45e4D2i73lAGjFw/99vxJuGAWi7VL/duXaJIkYMvzivQwgn6uStDNI5Wxtw
         zNjOsA0tm1e5OfVFUAlEK87zC+gnesD6jnix62ofFnmWsDJZTD7N51a5ZBhCP9GeS7AX
         l0K5c5IGU4/723DuXfaiHYJa1VGk6RvhEOZjjboWbqCk4v4VDwkvMEJQt7ybNY7QMb/L
         2BqpqyvkDqU84brXVgGKxsAT68f0Qy8OwjkiUIy1t7cUlPjxKQwPyOrevgWEcdnhvgNb
         xBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jyv2J8GskJGMGjx+w0SPcnYzz6laErbusqQ09GwF5TU=;
        b=PQ+KrGMd/A/N0WHGP3NuRKydONl+RTR9fFPeezCqGS+3RzcfKIzqdg4qN+8m2N1Sm4
         x4zsPKJxGe0bjG/qfmbDSOLy9jy48Wy/5+wew9Xvfz34AITs4WEuOgY9tZ/FGfbiz6z7
         KPZnQquJgIY+7zm//arXYM/s91A8WauRKW7NaqWGzK3CI09xOm9Q+YQdnGHPKa8BxQmz
         8sltH/fiq2cdIlfA+nNok1Il6t8oZtv4thDHliQ5EvyTyjFl4GJpqWiwl0PC9imd9BUo
         QzwFROlJ0q/D13IpNumoKuq1srnqJBa6/3R3VvxnuKkvt7M21jOsnoFGfwUlOQ+vgWXa
         Y3lQ==
X-Gm-Message-State: AOAM533d3Zbyoe8/iDM1T5PReYXbnGdn04P/L7J24QpkdnbMKXulfury
	qCXXGswk1A0HxhlFXuNBiXekpbrS
X-Google-Smtp-Source: ABdhPJw5UzLlFO6JNHvJOpy9+5D5c5BoWoi045KB4ofwDXUReLSUUGz6ALkWY5VJhZFhS8XrIR23dQ==
X-Received: by 2002:a1c:9993:: with SMTP id b141mr4133324wme.113.1591978585272;
        Fri, 12 Jun 2020 09:16:25 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u3sm9790622wmg.38.2020.06.12.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 09:16:24 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] gcab: Add recipe
Date: Fri, 12 Jun 2020 17:15:17 +0100
Message-Id: <20200612161517.7438-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-gnome/gcab/gcab/run-ptest |  3 +++
 meta-oe/recipes-gnome/gcab/gcab_1.4.bb    | 24 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gcab/gcab/run-ptest
 create mode 100644 meta-oe/recipes-gnome/gcab/gcab_1.4.bb

diff --git a/meta-oe/recipes-gnome/gcab/gcab/run-ptest b/meta-oe/recipes-gnome/gcab/gcab/run-ptest
new file mode 100644
index 000000000000..0cdb48ea33fc
--- /dev/null
+++ b/meta-oe/recipes-gnome/gcab/gcab/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libgcab
diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.4.bb b/meta-oe/recipes-gnome/gcab/gcab_1.4.bb
new file mode 100644
index 000000000000..68f52bf92d53
--- /dev/null
+++ b/meta-oe/recipes-gnome/gcab/gcab_1.4.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A GObject library to create cabinet files"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcab"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "glib-2.0"
+
+SRC_URI = "\
+    ${GNOME_MIRROR}/gcab/${PV}/gcab-${PV}.tar.xz \
+    file://run-ptest \
+"
+SRC_URI[sha256sum] = "67a5fa9be6c923fbc9197de6332f36f69a33dadc9016a2b207859246711c048f"
+
+inherit gobject-introspection gtk-doc manpages meson ptest-gnome vala
+
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('USE_NLS', 'yes', 'nls', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[nls] = "-Dnls=true,-Dnls=false"
+PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

