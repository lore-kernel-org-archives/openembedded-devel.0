Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F883C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.590.1642801149157462045
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bFJdNOuN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id az25so1983080wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dvna/bruC7B6TSwx6Bugx02A0xiypxLlfdtL/Ry2CJY=;
        b=bFJdNOuNK0gNEUUTePzHG5seQUPbsySI0r2m4AvFJzsOt9Q87n2YDps3dVLzRZdfAe
         3tFrbZWvJai+XBnYa4xjdL8hZJedFwmIMoYYPaMqI+NzK/6w+NFLmmDA2Y1cA6o5uvaO
         k8xAFZPcBKIgRSgQb7GDz7+ThSbUiFavBCGFb8Yv8gjzrc6+PZlk5crdi1k+2NPZYPSA
         IYxg8LPzDnH3SFqCVLcoNwIEecKJZ/6dwiUhCkJ+QjzU4T+rWVn+pEIFpBLDYzIQxSD9
         262SCnWLjil9x431FxzhtmXuEgznBzjIeJ7CcPe7cbZWNBbumGgbDNwhaHSO8AHNw6az
         /8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvna/bruC7B6TSwx6Bugx02A0xiypxLlfdtL/Ry2CJY=;
        b=BbXruTtx6sDna9hm0/7N4kLCkHy6vDWVQGzBwdHHvy+KgmWXPWjtmMxAEwa2JFXSAZ
         kN9e7I0yJ1gVYsKT3BO4NiNNwJeT/qH2jQn/Q8lPPgBN7HrCjFgQ4Y2GUp+uHpdnIOyW
         RulCwA2i6ldfpekZSNY0fsh1Nl/qJYpYSkTqYKb7kiAUnDZ6FUrjNzAQwNXQhg5CyYIo
         QoBfYyQ+Oiqxn/As+qonEhHZ3HkM+GlGhSeUphkb3nXriaxuB42RhY3WYw6V0aqg34JC
         qjUh8RY/tBl4gTGeLuaxx3+dCzkFUrh734suliJ7y0dVH3OVsS/9u0qKzI+4Y8Vh6R9L
         Al8g==
X-Gm-Message-State: AOAM530BVmmG241V/ZvxLM/8Clr8lnggeHPHXPP3Qd0Y+mR2zTHgODUi
	Z8+eAfr0rMu3QlIDih/5RyZYWWXr8tk=
X-Google-Smtp-Source: 
 ABdhPJyRV6G4k8vi813V8kUWM2PLMbWs9kIllH7kyGaNrzM1EPJTPP9QtmI/ilOT6Cc1CyEKM0lcLg==
X-Received: by 2002:adf:9f14:: with SMTP id l20mr5373937wrf.65.1642801147656;
        Fri, 21 Jan 2022 13:39:07 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 02/19] gjs: drop patch to satisfy meson 0.61
Date: Fri, 21 Jan 2022 22:38:41 +0100
Message-Id: <20220121213858.762625-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94980

With this version of meson the patch is no longer needed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...r-install-via-list-to-pacify-meson-0.patch | 79 -------------------
 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb    |  1 -
 2 files changed, 80 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch
deleted file mode 100644
index cf85c4e70..000000000
--- a/meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 4c8c84941146715d9c7077e8c5625490332d8bc5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 10 Dec 2021 09:32:17 -0800
-Subject: [PATCH] build: disable gir install via list to pacify meson >= 0.60.2
-
-Fixes
-../gjs-1.70.0/meson.build:564:0: ERROR: "install_dir" must be specified when installing a target
-
-see meson bug
-https://github.com/mesonbuild/meson/issues/9472
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- installed-tests/js/libgjstesttools/meson.build | 2 +-
- installed-tests/js/meson.build                 | 6 +++---
- meson.build                                    | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/installed-tests/js/libgjstesttools/meson.build b/installed-tests/js/libgjstesttools/meson.build
-index 2e57483..3ca4d7e 100644
---- a/installed-tests/js/libgjstesttools/meson.build
-+++ b/installed-tests/js/libgjstesttools/meson.build
-@@ -14,7 +14,7 @@ gjstest_tools_gir = gnome.generate_gir(libgjstesttools,
-     includes: ['GObject-2.0', 'Gio-2.0'], sources: gjstest_tools_sources,
-     namespace: 'GjsTestTools', nsversion: '1.0',
-     symbol_prefix: 'gjs_test_tools_', extra_args: '--warn-error',
--    install: get_option('installed_tests'), install_dir_gir: false,
-+    install: get_option('installed_tests'), install_dir_gir: [false],
-     install_dir_typelib: installed_tests_execdir)
- gjstest_tools_typelib = gjstest_tools_gir[1]
- libgjstesttools_dep = declare_dependency(
-diff --git a/installed-tests/js/meson.build b/installed-tests/js/meson.build
-index b42f3b2..1085e2f 100644
---- a/installed-tests/js/meson.build
-+++ b/installed-tests/js/meson.build
-@@ -74,7 +74,7 @@ regress_gir = gnome.generate_gir(libregress, includes: regress_gir_includes,
-     sources: regress_sources, namespace: 'Regress', nsversion: '1.0',
-     identifier_prefix: 'Regress', symbol_prefix: 'regress_',
-     extra_args: ['--warn-all', '--warn-error'] + regress_gir_c_args,
--    install: get_option('installed_tests'), install_dir_gir: false,
-+    install: get_option('installed_tests'), install_dir_gir: [false],
-     install_dir_typelib: installed_tests_execdir)
- regress_typelib = regress_gir[1]
- 
-@@ -91,7 +91,7 @@ if not skip_warnlib
-     warnlib_gir = gnome.generate_gir(libwarnlib, includes: ['Gio-2.0'],
-         sources: warnlib_sources, namespace: 'WarnLib', nsversion: '1.0',
-         symbol_prefix: 'warnlib_', header: 'warnlib.h',
--        install: get_option('installed_tests'), install_dir_gir: false,
-+        install: get_option('installed_tests'), install_dir_gir: [false],
-         install_dir_typelib: installed_tests_execdir)
-     warnlib_typelib = warnlib_gir[1]
- endif
-@@ -105,7 +105,7 @@ gimarshallingtests_gir = gnome.generate_gir(libgimarshallingtests,
-     includes: ['Gio-2.0'], sources: gimarshallingtests_sources,
-     namespace: 'GIMarshallingTests', nsversion: '1.0',
-     symbol_prefix: 'gi_marshalling_tests_', extra_args: '--warn-error',
--    install: get_option('installed_tests'), install_dir_gir: false,
-+    install: get_option('installed_tests'), install_dir_gir: [false],
-     install_dir_typelib: installed_tests_execdir)
- gimarshallingtests_typelib = gimarshallingtests_gir[1]
- 
-diff --git a/meson.build b/meson.build
-index 192b1b5..076656d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -565,7 +565,7 @@ gjs_private_gir = gnome.generate_gir(libgjs,
-     includes: ['GObject-2.0', 'Gio-2.0'], sources: libgjs_private_sources,
-     namespace: 'GjsPrivate', nsversion: '1.0', identifier_prefix: 'Gjs',
-     symbol_prefix: 'gjs_', extra_args: '--warn-error', install: true,
--    install_dir_gir: false, install_dir_typelib: pkglibdir / 'girepository-1.0')
-+    install_dir_gir: [false], install_dir_typelib: pkglibdir / 'girepository-1.0')
- gjs_private_typelib = gjs_private_gir[1]
- 
- ### Build gjs-console interpreter ##############################################
--- 
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
index e0d982123..af4d7f6ca 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
@@ -12,7 +12,6 @@ SRC_URI[archive.sha256sum] = "4b0629341a318a02374e113ab97f9a9f3325423269fc1e0b04
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-    file://0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch \
 "
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.20.1


