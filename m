Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.48763.1591047933965874247
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WBa9SBbA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id u26so870852wmn.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DR39oIpYPrEM8OxJ1tn3zyHYCLtwHQZbExNKpecWHwM=;
        b=WBa9SBbAn8nu7+KvKQHgF18QYohqfrte5m81oyRIxn0VOf4/7EDRYhEfGnFVKQkO08
         NlclV6VpoofMwr6DP4fhjuKupyzq9ZKGo0/ep5eC4xsDbw2w/LX5s6vLOdOABqii+o6j
         y9W8SAaJqa+j70heyl/4Dkz07M0r0S2b9N59nHfkblhIpeUR4WcQkAPA/KieZ6uWuRZT
         ap/dUUKwVx4XxlALOf41ZxmN5tTNqS1UyinY9VbZtxQHz9MKDuTKzV0PHtWG4ATLunO4
         bmVQpuClG561JAag23z6EGw7+L3aahq0c2xQihKepGqAISAdDK8hUHRpALBDFnwnwhfY
         Piwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DR39oIpYPrEM8OxJ1tn3zyHYCLtwHQZbExNKpecWHwM=;
        b=N3XycGd261kVkLqNEM+DmDc3+ux7/OSMvKkBkcVzEPBHtObdkPDKXbN4hb3cTQyQYi
         5kJXP9jR7UtJZ80llgEsMYfshHQq3JcZIfoEe2yCcXsG4CgTO1yaxlvbfUbAvIULcszT
         zLK+tPeOsNZhKcwlMYwjQXxfLu9MV6rhcguqCgTuq6fGvpLqonp6DSWHUfSxv1kJekAr
         fE9IH0Jsp/jAGrdpd3OqDQmyCoa+GDGKfN4SJZUiMdnHunz/kfVFSpSfLaq9ldxkTQ8t
         OXXik3yiO3CIwrI9PhIfGJd/7KNXLM07LJv+FBh2LDdKAcqWVFzy0WcKjYk3YrQ2fgT3
         bFFg==
X-Gm-Message-State: AOAM531tuthTGvYnJKJTPAyr0oQAhCktmOAvVIrec9FXuUDAAew5fjsB
	Yq0zWeJBQ49no3le+f7sSaJ6Bq/tiGw=
X-Google-Smtp-Source: ABdhPJxinVAHYFNWrLtgH7H9MyuDyMZPrgKp2t8HjCGrYJy4AAvYwd+F5awvbDlFesHlbv4qVXFYvg==
X-Received: by 2002:a1c:b385:: with SMTP id c127mr1088926wmf.132.1591047932243;
        Mon, 01 Jun 2020 14:45:32 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:31 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/38] dconf: upgrade 0.34.0 -> 0.36.0
Date: Mon,  1 Jun 2020 23:44:42 +0200
Message-Id: <20200601214516.26624-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix-meson-0.52.patch was applied upstream

Changes in dconf 0.36.0
=======================

 - No changes since 0.35.1

Changes in dconf 0.35.1
=======================

 - Writer service: avoid writing to disk and emitting changed signals
   when write requests do not result in changes to the database (Daniel
   Playfair Cal, !3)
 - build: Drop redundant `install` key from `configure_file()` (Philip
   Withnall, !53)
 - build: Update abicheck.sh script to work with GCC 9 (Diego
   Escalante Urello, !55)
 - build: Update use of link_whole for meson-0.52 (Diego Escalante
   Urello, !54)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../dconf/dconf/fix-meson-0.52.patch          | 25 -------------------
 .../{dconf_0.34.0.bb => dconf_0.36.0.bb}      |  6 ++---
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.34.0.bb => dconf_0.36.0.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch b/meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch
deleted file mode 100644
index 485c46509..000000000
--- a/meta-gnome/recipes-gnome/dconf/dconf/fix-meson-0.52.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-With meson 0.52 the build fails due to duplicate symbols. There is a fix
-to meson but the dconf build also needs tweaking.
-
-https://gitlab.gnome.org/GNOME/dconf/issues/59
-https://github.com/mesonbuild/meson/pull/5936
-
-Despite the comments there about this being incorrect, libdconf is unchanged
-between 0.51 and 0.52 and this patch.
-
-Upstream-Status: Pending [under discussion, see above links]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: dconf-0.34.0/client/meson.build
-===================================================================
---- dconf-0.34.0.orig/client/meson.build
-+++ dconf-0.34.0/client/meson.build
-@@ -28,7 +28,7 @@ libdconf_client = static_library(
- 
- libdconf_client_dep = declare_dependency(
-   dependencies: gio_dep,
--  link_whole: libdconf_client,
-+  link_with: libdconf_client,
- )
- 
- libdconf = shared_library(
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
index 3c3802f34..914672688 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.md5sum] = "a3ab18ed51a0494a1c8436fef20cc1b0"
-SRC_URI[archive.sha256sum] = "943a94ab16121de5580ceaed2605b87444d1bca1c6cd8beefb778bcb0aa2da52"
+SRC_URI[archive.md5sum] = "1a50c988d9f0206f74a44f7c6d09cead"
+SRC_URI[archive.sha256sum] = "9fe6bb22191fc2a036ad86fd8e7d165e9983c687b9fedccf85d46c799301da2d"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
@@ -12,8 +12,6 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase bash-completion vala
 
-SRC_URI += "file://fix-meson-0.52.patch"
-
 # I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 EXTRA_OEMESON = "-Dman=false"
 # no bash-completion for native
-- 
2.21.3

