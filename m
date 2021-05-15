Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.567.1621121949335600628
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l6HTCFfN;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b17so2680285ede.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eutkNaQsZmNsTjKGp2+i2kiwmIKH7eEvFOjF9RDkEbE=;
        b=l6HTCFfNjxgRk6aangb6wIXQ8kr9mkENZ7gP4owD5WP3kep5oP45g/ypSX/6lRbNhL
         sCkVMsTpIuB1nscbXKTevOgAZtX3NvsGyjpD409+R/5HnXd0hhClPoCBwrQRenaSH6Go
         icEIxXJDip6YAT00LFjCruXiwQ06gFDGnNIHpTu/BWBQsTMGyciVC24az0Nf9GV3ZsF0
         r0OWBPBaLJJwvKFAmuDzO2H05eSuiW4PsvxeZ0oeVs0CTJRx7jx3lgybuKQV2eWxR+3A
         2NYzGm6H2oXu21mm8j9uf2jpVFufTiCv+F/+ebKqN4lcAwlTxxE5iFE3nxzjbhFOLonp
         DQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eutkNaQsZmNsTjKGp2+i2kiwmIKH7eEvFOjF9RDkEbE=;
        b=pz0K22iWyhASJLpg93+6snmDHT3ffuP76Y721VU0eRI4k8Gp0fySgajy+ldwUKWrYL
         xJNW87BldA+x/CRGreYIvrCGcvBXXdbwYv6MbQ/0lFVE5sHsRvvwMzEea7zKai3OoxnM
         M4D1lNDxslSGbNHhve0pjpp6aq/Jv5qNT5L4qqkqnqkW7hoAOG796MmMWdSNcfcqOrP9
         oN/d2yvTfAP+dAahakJNJu3sKWi1he+VZ1MybZJTLMQxbYOnbXVUNSVeBfEYFmekN52w
         E2/PcSzubDtkgeqKIju8PEym4ThpQPFWDGI93jg9/BZ9yPuuY8LO9BU1Q15Lf8qpKjbW
         UPag==
X-Gm-Message-State: AOAM531uYoISx7+aue4YzRQAvKi+x9Gfflq5h0sUaq6HYr5w+SUy27gs
	UTTsCAJFqtKDabGuBdDTZi1owAOl61M=
X-Google-Smtp-Source: ABdhPJzGEHSGb58BsAxyl96AKXCa+uOlECqr1jMl/8OL2iewv4P+9uZmKERr0nmz/o+4wsSckzS4yw==
X-Received: by 2002:aa7:da03:: with SMTP id r3mr31244973eds.121.1621121947946;
        Sat, 15 May 2021 16:39:07 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:07 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/20] nautilus: upgrade 3.36.3 -> 40.1
Date: Sun, 16 May 2021 01:38:36 +0200
Message-Id: <20210515233853.583490-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 3.36.3 stopped building with meson 0.58.0
* backported patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nautilus/0001-Drop-use-of-volatile.patch  | 32 -------------------
 .../{nautilus_3.36.3.bb => nautilus_40.1.bb}  | 14 ++++++--
 2 files changed, 11 insertions(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_3.36.3.bb => nautilus_40.1.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch
deleted file mode 100644
index 46831429d..000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9ab5acb902a38b420592931ec9e46ccd0624035a Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Wed, 13 Jan 2021 13:22:58 +0100
-Subject: [PATCH] Drop use of volatile
-
-The `fedora rawhide` CI job currently fails because of usage of the
-`volatile` qualifier. Let's drop the `volatile` qualifier as it doesn't
-help anyway. It was dropped in GLib as well, see:
-https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1719
-
-Fixes: https://gitlab.gnome.org/GNOME/nautilus/-/issues/1741
----
-Upstream-Status: Backport [https://github.com/GNOME/nautilus/commit/9b733dd9df9d6d9805c56749d05ada15a7560ef4]
- src/nautilus-enum-types.c.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/nautilus-enum-types.c.template b/src/nautilus-enum-types.c.template
-index 00155ca..9d8ac83 100644
---- a/src/nautilus-enum-types.c.template
-+++ b/src/nautilus-enum-types.c.template
-@@ -13,7 +13,7 @@
- GType
- @enum_name@_get_type (void)
- {
--    static volatile GType type_once = 0;
-+    static GType type_once = 0;
- 
-     if (g_once_init_enter (&type_once))
-     {
--- 
-2.30.1
-
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
index cf138d973..09e075044 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
@@ -13,16 +13,23 @@ DEPENDS = " \
     gsettings-desktop-schemas \
     gnome-autoar \
     tracker \
+    libhandy \
+    libportal \
 "
 
 inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even mime-xdg
 
-SRC_URI += "file://0001-Drop-use-of-volatile.patch"
-SRC_URI[archive.md5sum] = "c3c8dbb90d8eeed6c127aa568e131395"
-SRC_URI[archive.sha256sum] = "b6cafc7ab1e70a64383de391b6097fcccbf36b208f8502d8c46423224fd30ef8"
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
+SRC_URI[archive.sha256sum] = "8ecfb90174a0bd5815b1ceb9cbfcd91fec0fb5e34907a4f2df2d05e5d6c99d33"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+EXTRA_OEMESON += " \
+    -Dtests=none \
+"
+
 PACKAGECONFIG = "extensions"
 PACKAGECONFIG[extensions] = "-Dextensions=true,-Dextensions=false, gexiv2 gstreamer1.0-plugins-base"
 
@@ -30,6 +37,7 @@ FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/metainfo \
     ${datadir}/gnome-shell \
+    ${datadir}/tracker3 \
 "
 
 # mandatory - not checked during configuration:
-- 
2.31.1

