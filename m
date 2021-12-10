Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE3EC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:36:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.10533.1639157766936197014
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O789t6F8;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so9926035pju.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGLCECVruGZ5uXWyN1OpWn5utkmkiwuSsKVIoCvljuw=;
        b=O789t6F8G9ymz5z9xYtnE9v02wnK2JE11JyFnPYx6YAUz71ndDgdHID7abDGw50YgN
         4AeLuBrF/l5ug6WC9a70sNt+Um1Gv0fdhLHelT0sSnY6bLWMueKtvb+pc0IvrHLwzwd4
         RggGc/wCm+L2/guOI7dhe1vJsCY18K4vHtawuEmCCkodIuzmouXTrpHXMJ8dprQ3yGU0
         Ir/NhAnSRrxGdcaeUVvdStsQrKp7lPkrntY718uEc7QJtmolETtqxDgy6NeXVNPYonSO
         pS76B9M2kw/obs/i/bMVoSl9uAT2LyzbrOf38gP/GH5Q/qMyX8KN3lAxEiLVW5SaDse3
         bHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGLCECVruGZ5uXWyN1OpWn5utkmkiwuSsKVIoCvljuw=;
        b=MHzifAj8l/OPCY3hOxTIuzzQsfoJXEWSt70anKnaz77MoBz+IWGEY2YO2mQI2yMGN4
         rPcC+c3I0shPsGQl85DM3SkPWz2CCzSutwFTY9pV8HcVi7HUVQLfZnO8Q/utjEwmsnO1
         6Ur3ps45byr4Ww3pxlB0He1MBhXd6u91lB0q9VBcSItX7iTqvxD+RWacSjgqGBkGctbc
         g64FdCZ0I/ALg6FYDVqRS/KPgh16QTf9JBZM5smb4+lrgeRfTOuQZTYXBoDgFrGSRu0E
         VefjxP38rhyklW9f4fyIJeeD4x5Mgma6i8OgwwZP1/QzWhRuviKl3kdmSyuinGY7MPGX
         ETVA==
X-Gm-Message-State: AOAM533tvZJSKHQz/CDjZIw32KAt3VAV22hL9LotWlYzpt0dms0jIYnQ
	PrVz+K72prO+0uxzklyJWtYok35Tk8ioPg==
X-Google-Smtp-Source: 
 ABdhPJxZtQf3xe+54qqk8rKVAjwzCIMvdPGVhHuXbkiLAV4HOU73+u4Z68zR+nAMBywZv2F3vIuC+g==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr25207017pjt.168.1639157766057;
        Fri, 10 Dec 2021 09:36:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 s21sm4013474pfk.3.2021.12.10.09.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 09:36:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gjs: Fix build failures with meson 0.60.2
Date: Fri, 10 Dec 2021 09:36:03 -0800
Message-Id: <20211210173603.2826515-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 17:36:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94279

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-install-via-list-to-pacify-meson-0.patch | 79 +++++++++++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb    |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch

diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch
new file mode 100644
index 0000000000..cf85c4e70c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch
@@ -0,0 +1,79 @@
+From 4c8c84941146715d9c7077e8c5625490332d8bc5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 Dec 2021 09:32:17 -0800
+Subject: [PATCH] build: disable gir install via list to pacify meson >= 0.60.2
+
+Fixes
+../gjs-1.70.0/meson.build:564:0: ERROR: "install_dir" must be specified when installing a target
+
+see meson bug
+https://github.com/mesonbuild/meson/issues/9472
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ installed-tests/js/libgjstesttools/meson.build | 2 +-
+ installed-tests/js/meson.build                 | 6 +++---
+ meson.build                                    | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/installed-tests/js/libgjstesttools/meson.build b/installed-tests/js/libgjstesttools/meson.build
+index 2e57483..3ca4d7e 100644
+--- a/installed-tests/js/libgjstesttools/meson.build
++++ b/installed-tests/js/libgjstesttools/meson.build
+@@ -14,7 +14,7 @@ gjstest_tools_gir = gnome.generate_gir(libgjstesttools,
+     includes: ['GObject-2.0', 'Gio-2.0'], sources: gjstest_tools_sources,
+     namespace: 'GjsTestTools', nsversion: '1.0',
+     symbol_prefix: 'gjs_test_tools_', extra_args: '--warn-error',
+-    install: get_option('installed_tests'), install_dir_gir: false,
++    install: get_option('installed_tests'), install_dir_gir: [false],
+     install_dir_typelib: installed_tests_execdir)
+ gjstest_tools_typelib = gjstest_tools_gir[1]
+ libgjstesttools_dep = declare_dependency(
+diff --git a/installed-tests/js/meson.build b/installed-tests/js/meson.build
+index b42f3b2..1085e2f 100644
+--- a/installed-tests/js/meson.build
++++ b/installed-tests/js/meson.build
+@@ -74,7 +74,7 @@ regress_gir = gnome.generate_gir(libregress, includes: regress_gir_includes,
+     sources: regress_sources, namespace: 'Regress', nsversion: '1.0',
+     identifier_prefix: 'Regress', symbol_prefix: 'regress_',
+     extra_args: ['--warn-all', '--warn-error'] + regress_gir_c_args,
+-    install: get_option('installed_tests'), install_dir_gir: false,
++    install: get_option('installed_tests'), install_dir_gir: [false],
+     install_dir_typelib: installed_tests_execdir)
+ regress_typelib = regress_gir[1]
+ 
+@@ -91,7 +91,7 @@ if not skip_warnlib
+     warnlib_gir = gnome.generate_gir(libwarnlib, includes: ['Gio-2.0'],
+         sources: warnlib_sources, namespace: 'WarnLib', nsversion: '1.0',
+         symbol_prefix: 'warnlib_', header: 'warnlib.h',
+-        install: get_option('installed_tests'), install_dir_gir: false,
++        install: get_option('installed_tests'), install_dir_gir: [false],
+         install_dir_typelib: installed_tests_execdir)
+     warnlib_typelib = warnlib_gir[1]
+ endif
+@@ -105,7 +105,7 @@ gimarshallingtests_gir = gnome.generate_gir(libgimarshallingtests,
+     includes: ['Gio-2.0'], sources: gimarshallingtests_sources,
+     namespace: 'GIMarshallingTests', nsversion: '1.0',
+     symbol_prefix: 'gi_marshalling_tests_', extra_args: '--warn-error',
+-    install: get_option('installed_tests'), install_dir_gir: false,
++    install: get_option('installed_tests'), install_dir_gir: [false],
+     install_dir_typelib: installed_tests_execdir)
+ gimarshallingtests_typelib = gimarshallingtests_gir[1]
+ 
+diff --git a/meson.build b/meson.build
+index 192b1b5..076656d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -565,7 +565,7 @@ gjs_private_gir = gnome.generate_gir(libgjs,
+     includes: ['GObject-2.0', 'Gio-2.0'], sources: libgjs_private_sources,
+     namespace: 'GjsPrivate', nsversion: '1.0', identifier_prefix: 'Gjs',
+     symbol_prefix: 'gjs_', extra_args: '--warn-error', install: true,
+-    install_dir_gir: false, install_dir_typelib: pkglibdir / 'girepository-1.0')
++    install_dir_gir: [false], install_dir_typelib: pkglibdir / 'girepository-1.0')
+ gjs_private_typelib = gjs_private_gir[1]
+ 
+ ### Build gjs-console interpreter ##############################################
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
index af4d7f6cac..e0d9821239 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
@@ -12,6 +12,7 @@ SRC_URI[archive.sha256sum] = "4b0629341a318a02374e113ab97f9a9f3325423269fc1e0b04
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
+    file://0001-build-disable-gir-install-via-list-to-pacify-meson-0.patch \
 "
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.34.1


