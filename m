Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11801.1795762955232987968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pqqK+ohj;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6789551c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762955; x=1796367755; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGTmKDISj2icqKBDRtzbTmZGVuvNNnS4bUv2jzLbKz0=;
        b=pqqK+ohjRmEnW+7MyGHBOfnKrDHdxX2BD5GqytjbFeRuYsdoASgMJoGeC3arN2U78q
         YBFqeAwSNCkYM5WcpMrAWmYzMTy+c2MXDUyBk85euscnFxXqoarMc2t1qOiJJHPq6V1g
         xBZAHXYzUzgCsu7oURiUBXqGxbovacpwsYP8sZGUaug3aNQAUykDArzKIzVbo7+Yk1cO
         FqFMzfh03yetjEZYLNvJI/lcmv7cwQEzoYMWnm7Se5mufB8QXXPuicmw/Lt27jrobAmp
         NJHpN027FB9lWGD6BG9SiONROZK1J73U4emGCqLC7XCumPcP3PMTxR9kVVNISUiool7u
         O1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762955; x=1796367755;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGTmKDISj2icqKBDRtzbTmZGVuvNNnS4bUv2jzLbKz0=;
        b=2thFdvWRKa/jXrh2ubDSC08U4JP0huphDt8qFaoQf+j0Mfb6kXS/P4zf1NZg07ICXU
         A55HfuiMillojppg7KLBsF6WqEgPjgth9QEWE79njbl1i07oU2skUULURPWkSZt6P7vA
         ZDw1wE7pF8ffZHoUPpznSEBxay8izxNnVUWuOYZwDHKQeDW5wSm+hS0GCSCanlPGi9w6
         86oeF8+oaxM1QoNvFHfD/H6VNjEI0b5I4CGJN9B944YshwQ2nnZp+5vqGflnmqC3OjUO
         lBqD7PRl/Jd62tmip8CZewyF0eeROt6/z1fcVuU1ANT2yJ/FDnO5LtsrDvRWS8He8RRB
         /mAA==
X-Gm-Message-State: APuU4Z9NcQyeleM6EunhWZhGzom0B/FUOWExhktdI2n9FDmI6yOEBUuM
	muQj2n67ZNuRU1frGm8zyEkUVwctY2e24yDkuHVnjdg0i0TepIpEkCLyRqPWZPwC
X-Gm-Gg: AZFdTZcxarNNUJ5fv3U3yVPd3piMzr4XVCCbhOCsfcxzOVbasHCGOZFAi5zMz/arPOY
	Pmh8yCVr1Gn2CD6krL7rjXnb5L/60/J9lVmXiy9zXPHeL9OymkKJsSYFXhQ6tYXNivRwAYO727s
	WMB8SpvRHDQwqmd3yXgnyStygDCxbKuRabC8oRoIOEG9MC1CxGAFM9IzfvHB7RXNXRtRqt84in6
	X+fPPWsogg7IQedoQC5KsV7ENPqIgjcOBhbu3c5D1q6ytN10J96mWDjVMWEjFch6J5uvWXeKz9D
	LZP1XIQmnEUqL7qExtP1gjkFwPe/k+vfAqPdEnpo8Ssk/ZvdayE0n4oOazrp2kUAfV2ZZ18wn+2
	ls9YrXlek3/KzVJP5heaKxl+2CudKUqCe0V6nkq6XBzgQDqn3hFyL5fI2D6nsmbpekCAiaOaMhk
	RjCxouKw9nJKNRAiadP0RRzZL45LVtSZmv5qL57gSIP5EqIFlSfdp8ASYh0sghdzi7pGOXBJGnW
	qkAMEPQvYcQtcuHk+66Ar2rfvFL+IT3DL8ZHUoiT/gZFrWRpNDjcKzx6fh3c+N3MozR4aLuGCzN
	Scpp2yZ1svLZwi7Y5wMfgMefIbP0R8IT5IuRXXNMLwHp9JMWfLAjPHFrz87pXxxC+ZRKCEX8ojY
	SKWjosw27ixdWyHnMBWq4yZ9f2WwuxjD+SKjjsB8Y48qhlaOWrL/JVCF1FjpAiWbvgiGHLghBlj
	thN2EKjLVSuimh5dniXEz7KeU998ke1oWrvbKNpH1ZSXGot9iw/weyhHhN+Gkrxp+ZKPeRF/QxK
	445LZgbLgb25iuLnjd5+yi3Q94o9CDtQ7FXhz+wIZNYHEQKlAn2UwfwmgnyVhzsdPrRZ5rPfoz2
	wnE4
X-Received: by 2002:a05:701b:4555:20b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1b556894b6emr25572520c88.14.1795762954535;
        Thu, 26 Nov 2026 23:02:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 18/21] libgweather4: upgrade 4.4.4 -> 4.6.0
Date: Thu, 26 Nov 2026 23:02:06 -0800
Message-ID: <20261127070211.2329979-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133345
Content-Type: text/plain; charset="utf-8"

4.5 moved the locations database to the separate gweather-locations
module, dropped libsoup 2 support and updated the METAR endpoint; 4.6.0
is the stable release of that series.

Depend on gweather-locations at build and run time, and skip the recipe
when it cannot be built (without GI_DATA_ENABLED). libgweather no longer
generates the database, so python3-pygobject-native and the
GI_TYPELIB_PATH export are dropped. Refresh the cross gir patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-Allow-building-gir-in-cross-environments.patch | 10 +++++-----
 ...{libgweather4_4.4.4.bb => libgweather4_4.6.0.bb} | 13 +++++++++----
 2 files changed, 14 insertions(+), 9 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.4.4.bb => libgweather4_4.6.0.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow-building-gir-in-cross-environments.patch b/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow-building-gir-in-cross-environments.patch
index 3a075de651..6e355cbe33 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow-building-gir-in-cross-environments.patch
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4/0001-Allow-building-gir-in-cross-environments.patch
@@ -13,14 +13,14 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 
---- a/meson.build	2022-09-18 14:48:53.000000000 +0200
-+++ b/meson.build	2022-11-26 14:05:13.302487232 +0100
-@@ -51,7 +51,7 @@
- gen_locations_variant = find_program('build-aux/meson/gen_locations_variant.py')
+--- a/meson.build
++++ b/meson.build
+@@ -49,7 +49,7 @@
+ ]
  
  g_ir_scanner = find_program('g-ir-scanner', required: get_option('introspection'))
 -build_gir = get_option('introspection') and g_ir_scanner.found() and not meson.is_cross_build()
 +build_gir = get_option('introspection') and g_ir_scanner.found()
  build_docs = get_option('gtk_doc') and build_gir
  
- schemas_srcdir = meson.project_source_root() / 'schemas'
+ locations_bin = dependency('gweather-locations').get_variable(
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.6.0.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather4_4.6.0.bb
index 57f599211a..8aad70466b 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.6.0.bb
@@ -11,7 +11,7 @@ inherit gnomebase gsettings gobject-introspection gettext gi-docgen vala feature
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI += "file://0001-Allow-building-gir-in-cross-environments.patch"
-SRC_URI[archive.sha256sum] = "7017677753cdf7d1fdc355e4bfcdb1eba8369793a8df24d241427a939cbf4283"
+SRC_URI[archive.sha256sum] = "7f5d0e8c9685ef2ff46c2f3a57cae48d7bf3540b2d83921f889ef28e6a876788"
 
 # 40.0 is an older libgweather-3 release; odd minors are development releases
 UPSTREAM_CHECK_REGEX = "libgweather-(?P<pver>4\.\d*[02468](\.\d+)+)\.tar"
@@ -19,16 +19,21 @@ UPSTREAM_CHECK_REGEX = "libgweather-(?P<pver>4\.\d*[02468](\.\d+)+)\.tar"
 GTKDOC_MESON_OPTION = "gtk_doc"
 VALA_MESON_OPTION = "enable_vala"
 
-export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
-
 DEPENDS = " \
     geocode-glib \
     gtk4 \
+    gweather-locations \
     json-glib \
     libsoup-3.0 \
-    python3-pygobject-native \
 "
 
+RDEPENDS:${PN} += "gweather-locations"
+
+python __anonymous() {
+    if d.getVar('GI_DATA_ENABLED') != 'True':
+        raise bb.parse.SkipRecipe("depends on gweather-locations, which needs GI_DATA_ENABLED")
+}
+
 FILES:${PN} += " \
     ${datadir}/libgweather-4 \
     ${libdir}/libgweather-4 \
