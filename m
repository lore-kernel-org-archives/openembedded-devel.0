Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B932C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:43:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.25394.1680183789699777157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZKx1FLCJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id w9so76704895edc.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680183788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzEa3Q9P4C1nywTMhvm3aalUBSHi9aYRK4DG5gTzLjk=;
        b=ZKx1FLCJYFj+IShyc6+VgzJ/1cBDX2FPRu6KRTtlAT8fAc7EzQqacIbM+9aea3AmAV
         Q03kmgBCUYs78LV3SOhuPfmfhkXGXZ5MjYOV2RnOL50lcisQn3uC5cfxuc8XZQf00fqh
         zOvbLDKC7k0e5r2y+BUkPKzkOqBeHUvfne5gfCy/JoycPBcIoppHA8Vw0AWILJtsKTRy
         iOUAcEXk+RzRLfvNpvWZIili3eX0afbZsGFK4Nt5qFTj/pbe0o9+YbVTgr2AmlrskIcS
         eOfo//cRM1iIVM/tOc0EoPvmI6gs4cmr+xwh34+0sylCAHEt5jwnDh45NigE4yLRFLSj
         PA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680183788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzEa3Q9P4C1nywTMhvm3aalUBSHi9aYRK4DG5gTzLjk=;
        b=OouthPAL5G9AM15vOjhZgqf3mv1OtI7lTfnqzEvpgB+pjXegGRa6j0pz/0yxu50ryK
         Uha+Lspe+100IJUxgS7BitgMOdmaj3Yv5IzJvUsB3LRBh3OjFJg6tjC6NZdH97GH69Wu
         CuW7EnBBUxj+vLiP+FFRTe4eoeLaV0SWyFWHkyYzq+qNV3QiS+ZXZmnDUV0mmE8qOwZd
         jfJINUYsAUrzoPg+Bq6kjCmTlC+eoIucb6ocejCPCVGbIE4uE7d4gG4fKOMAAwzgFtHb
         J3+6QOSlIz3g3YqDG86ltNzT+kUgcKyoRSfwEfAE7ptY2NgDrx5/PpjEwdvnoY23H4nv
         kZmQ==
X-Gm-Message-State: AAQBX9fk2Dasu6xgFAZtMkGbHuk2NNDVFj4IEEMdXE0RLKPcO1JjkpBx
	TWldMqbp+gPj4P346qYUL0ggsAlYjPc=
X-Google-Smtp-Source: AKy350Y4GyebxLsqsCG/Gv6qyWI23qyudNsvYvh3+BJ/ZcFE8QQWsyCxZ5/3AF6WWs6FuzoFkG0xag==
X-Received: by 2002:aa7:d3d4:0:b0:4fd:215e:b691 with SMTP id o20-20020aa7d3d4000000b004fd215eb691mr22418581edr.4.1680183787973;
        Thu, 30 Mar 2023 06:43:07 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm18388784edf.50.2023.03.30.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:43:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 2/3] libfprint: New recipe
Date: Thu, 30 Mar 2023 15:43:01 +0200
Message-Id: <20230330134302.2789448-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330134302.2789448-1-zboszor@gmail.com>
References: <20230330134302.2789448-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 13:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101836

libfprint is the library used by fprintd.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...001-Optionally-use-native-generators.patch | 111 ++++++++++++++++++
 .../0002-Make-building-tests-optional.patch   |  47 ++++++++
 .../libfprint/libfprint_1.94.5.bb             |  45 +++++++
 3 files changed, 203 insertions(+)
 create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch
 create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch
 create mode 100644 meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb

diff --git a/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch
new file mode 100644
index 000000000..779d78c28
--- /dev/null
+++ b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch
@@ -0,0 +1,111 @@
+From 4f0f84448dbc46c18d2700ddb45acdee67687574 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 30 Mar 2023 09:45:31 +0200
+Subject: [PATCH 1/2] Optionally use native generators
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fprint-list-udev-hwdb and fprint-list-udev-rules are run
+during the build to generate autosuspend.hwdb and 70-*.rules,
+respectively.
+
+Since they are not marked as "native: true", a cross-compiled
+version is not possible.
+
+Since these binaries are linked with the libfprint_drivers target,
+marking them as native binaries would also need libfprint_drivers
+to be duplicated as a native version and possibly other library
+targets, too.
+
+Instead, make it the responsibility of the cross-compiler
+framework to build the native variant separately and allow
+the external binaries to be passed in.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ libfprint/meson.build | 30 ++++++++++++++++++++----------
+ meson_options.txt     |  8 ++++++++
+ 2 files changed, 28 insertions(+), 10 deletions(-)
+
+diff --git a/libfprint/meson.build b/libfprint/meson.build
+index d3c8b03..2a4de67 100644
+--- a/libfprint/meson.build
++++ b/libfprint/meson.build
+@@ -301,11 +301,16 @@ libfprint_private_dep = declare_dependency(
+     ]
+ )
+ 
+-udev_hwdb = executable('fprint-list-udev-hwdb',
+-    'fprint-list-udev-hwdb.c',
+-    dependencies: libfprint_private_dep,
+-    link_with: libfprint_drivers,
+-    install: false)
++udev_hwdb_cmd = get_option('udev_hwdb_cmd')
++if udev_hwdb_cmd == ''
++    udev_hwdb = executable('fprint-list-udev-hwdb',
++        'fprint-list-udev-hwdb.c',
++        dependencies: libfprint_private_dep,
++        link_with: libfprint_drivers,
++        install: false)
++else
++    udev_hwdb = find_program(udev_hwdb_cmd)
++endif
+ 
+ udev_hwdb_generator = custom_target('udev-hwdb',
+     output: 'autosuspend.hwdb',
+@@ -315,12 +320,17 @@ udev_hwdb_generator = custom_target('udev-hwdb',
+     install: false,
+ )
+ 
++udev_rules_cmd = get_option('udev_rules_cmd')
+ if install_udev_rules
+-    udev_rules = executable('fprint-list-udev-rules',
+-        'fprint-list-udev-rules.c',
+-        dependencies: libfprint_private_dep,
+-        link_with: libfprint_drivers,
+-        install: false)
++    if udev_rules_cmd == ''
++        udev_rules = executable('fprint-list-udev-rules',
++            'fprint-list-udev-rules.c',
++            dependencies: libfprint_private_dep,
++            link_with: libfprint_drivers,
++            install: false)
++    else
++        udev_rules = find_program(udev_rules_cmd)
++    endif
+ 
+     custom_target('udev-rules',
+         output: '70-@0@.rules'.format(versioned_libname),
+diff --git a/meson_options.txt b/meson_options.txt
+index f9b801f..a6f0c4d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -14,6 +14,10 @@ option('udev_rules_dir',
+        description: 'Installation path for udev rules',
+        type: 'string',
+        value: 'auto')
++option('udev_rules_cmd',
++       description : 'Optional path for native build of fprint-list-udev-rules',
++       type : 'string',
++       value : '')
+ option('udev_hwdb',
+        description: 'Whether to create a udev hwdb for autosuspend (included in systemd v248 and later)',
+        type: 'feature',
+@@ -22,6 +26,10 @@ option('udev_hwdb_dir',
+        description: 'Installation path for udev hwdb',
+        type: 'string',
+        value: 'auto')
++option('udev_hwdb_cmd',
++       description : 'Optional path for native build of fprint-list-udev-hwdb',
++       type : 'string',
++       value : '')
+ option('gtk-examples',
+        description: 'Whether to build GTK+ example applications',
+        type: 'boolean',
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch
new file mode 100644
index 000000000..c83ea95e1
--- /dev/null
+++ b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch
@@ -0,0 +1,47 @@
+From 8e27d45a7747c9aaf8e619f2de3ad3eae9659da8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 30 Mar 2023 09:57:35 +0200
+Subject: [PATCH 2/2] Make building tests optional
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 4 ++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1badb16..05edb8d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -309,7 +309,9 @@ if get_option('gtk-examples')
+ endif
+ 
+ subdir('data')
+-subdir('tests')
++if get_option('tests')
++    subdir('tests')
++endif
+ 
+ pkgconfig = import('pkgconfig')
+ pkgconfig.generate(
+diff --git a/meson_options.txt b/meson_options.txt
+index a6f0c4d..175710d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -38,3 +38,7 @@ option('doc',
+        description: 'Whether to build the API documentation',
+        type: 'boolean',
+        value: true)
++option('tests',
++       description: 'Whether to build the tests',
++       type: 'boolean',
++       value: true)
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
new file mode 100644
index 000000000..b0133409a
--- /dev/null
+++ b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Library for fingerprint readers"
+DESCRIPTION = "libfprint is an open source software library \
+designed to make it easy for application developers to add \
+support for consumer fingerprint readers to their software."
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/fprint/libfprint/"
+
+DEPENDS = "glib-2.0 libgusb udev libgudev nspr nss pixman cairo"
+
+DEPENDS:append:class-target = " libfprint-native "
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+#PR = "r1"
+
+SRCREV = "86961a9429d589c387da37351fd6b4ff3caf67ea"
+
+SRC_URI = " \
+	git://anongit.freedesktop.org/git/libfprint/libfprint.git;branch=master;protocol=https \
+	file://0001-Optionally-use-native-generators.patch \
+	file://0002-Make-building-tests-optional.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig useradd python3native gobject-introspection
+
+EXTRA_OEMESON:class-native = "-Ddoc=false -Dtests=false -Dintrospection=false"
+
+EXTRA_OEMESON:class-target = "-Ddoc=false -Dtests=false \
+	-Dudev_hwdb=enabled -Dudev_hwdb_dir=${sysconfdir}/udev/hwdb.d \
+	-Dudev_hwdb_cmd=${STAGING_BINDIR_NATIVE}/fprint-list-udev-hwdb \
+	-Dudev_rules_cmd=${STAGING_BINDIR_NATIVE}/fprint-list-udev-rules \
+"
+
+do_install:append:class-native () {
+	install -d ${D}${bindir}
+	install -m0755 ${B}/libfprint/fprint-list-udev-hwdb ${D}${bindir}/fprint-list-udev-hwdb
+	install -m0755 ${B}/libfprint/fprint-list-udev-rules ${D}${bindir}/fprint-list-udev-rules
+}
+
+BBCLASSEXTEND = "native"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "fprint"
-- 
2.39.2


