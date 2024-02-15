Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B868BC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 08:39:25 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.9984.1707986363154403051
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 00:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHHFyK6P;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d0d799b55cso6994361fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 00:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707986361; x=1708591161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kz5fTCTDrXw9z+lymo6OiYGmJG9SCyd6jXxV1eXhd7U=;
        b=RHHFyK6PKuDTMkjL6JpMJjG1zjhSbsEpj1sGYXovfs9ks+6PHI+3slN0BdrlY24L81
         IuXtbPBY7RslvxbvJ4Rem0hJQRNtawmPoW7xaOvIPJsBBB8MXgfI5xcPJLtLNU79ggKF
         8NQHZupYFqFkTRO3+9K6k9GwtSdXp3Ad5jWP5uFqKHtC9EEEOLVQy4jeXY+WOQ0xXQYR
         hCnjHpo9HM1L54VcZ0jhtRcrtkWkI6W8w6vTHO0cdlO6MaPHSoMXLHZp5Q2jHcD8rqJ+
         7cMT0vtsj0SglHXMdE3ZvMaafTUekbSAMe/b13Y404GuwmMpE9Ugzdrcb2QPD8sWowIE
         mX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707986361; x=1708591161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kz5fTCTDrXw9z+lymo6OiYGmJG9SCyd6jXxV1eXhd7U=;
        b=koxpyiMqIndcsZ49bWBwldyxELzBLilKxhp0Pr81QsWNLQfUJGl0y1RRCeaSgK4gnS
         ptdCo4XejolnCL0/0h3523kvg1BMejhiPskyKJH6T+QAuoFAwwrLkSd+aAZE0svdq2Oh
         kvFDconLmySpOvagPmOqsCn7S0t1PO/1VFy/FcHbhAFP32jjo7nrYFTTGqhA2smIm5XA
         xRG58h8Fjy166KBqfiJLKlLj1qcZrkRMjU9/jL5wQbvB9uXoMEzlgPxe6smnNDyG7D5d
         a+JB344MV8UFMqWfsYWtD+Vz8WG/3YXUjX8scUh/2EXxKffmeHQTDCYq7Z4M7CRnXwTw
         pnAw==
X-Gm-Message-State: AOJu0YyXhu2E3ftWlzcdqLLumr/Jtv0bsHyVjieprbtxvfZz8zifEoaV
	1A3YlFAb/Y3mTA9f6n3bGY6NAM+iUS+/UNQwEIKPw4fnroubnzl05+ZzL9ss
X-Google-Smtp-Source: AGHT+IEqPHwUi/UC7NgFFrZeEikNKRlGK2M953U8LnHMQsJ6i72ezr0vAsa+VU9qAXakgFxT0XNhnQ==
X-Received: by 2002:a2e:9cd5:0:b0:2d0:e36a:6424 with SMTP id g21-20020a2e9cd5000000b002d0e36a6424mr958812ljj.35.1707986360084;
        Thu, 15 Feb 2024 00:39:20 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id e6-20020a05651c04c600b002d208dec849sm183469lji.99.2024.02.15.00.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 00:39:19 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] plymouth: uprev to 24.004.60
Date: Thu, 15 Feb 2024 09:39:12 +0100
Message-Id: <20240215083912.1650809-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 08:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108750

From: Ming Liu <liu.ming50@gmail.com>

The changes include:
- Change to use meson buildsystem.
- Fix build issues in OE.
- Move patches from files to plymouth subdirectory.
- Make themes build/installation optional, since a user might not want
  all themes to be installed to rootfs, now he can set PLYMOUTH_THEMES
  to chose the themes.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...tall-ignoring-configured-runstatedir.patch |  30 -----
 ...o-systemd-tty-ask-password-agent-con.patch |  34 -----
 ...-standard-runstatedir-vs-custom-flag.patch |  50 --------
 ...-Avoid-linking-to-plymouth_logo_file.patch |  28 ++++
 .../plymouth/0001-Drop-libdl-references.patch |  70 ++++++++++
 ...o-systemd-tty-ask-password-agent-con.patch |  63 +++++++++
 .../0001-Make-themes-build-optional.patch     | 120 ++++++++++++++++++
 ...lymouth-Add-the-retain-splash-option.patch |   0
 ...ervice-in-add-related-kernel-paramet.patch |   0
 .../plymouth/plymouth_22.02.122.bb            |  73 -----------
 .../plymouth/plymouth_24.004.60.bb            | 102 +++++++++++++++
 11 files changed, 383 insertions(+), 187 deletions(-)
 delete mode 100644 meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch
 delete mode 100644 meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
 delete mode 100644 meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch
 create mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-Avoid-linking-to-plymouth_logo_file.patch
 create mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-Drop-libdl-references.patch
 create mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
 create mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-Make-themes-build-optional.patch
 rename meta-oe/recipes-core/plymouth/{files => plymouth}/0001-plymouth-Add-the-retain-splash-option.patch (100%)
 rename meta-oe/recipes-core/plymouth/{files => plymouth}/0001-plymouth-start-service-in-add-related-kernel-paramet.patch (100%)
 delete mode 100644 meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb
 create mode 100644 meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb

diff --git a/meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch b/meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch
deleted file mode 100644
index e04917e30..000000000
--- a/meta-oe/recipes-core/plymouth/files/0001-Fix-daemon-install-ignoring-configured-runstatedir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4c90a66fb7fd9dbb861c5a888fc828f3795fe540 Mon Sep 17 00:00:00 2001
-From: Ben Brown <ben@demerara.io>
-Date: Tue, 19 Jul 2022 16:12:12 +0100
-Subject: [PATCH] Fix daemon install ignoring configured runstatedir
-
-Upstream-Status: Backport
-
-Signed-off-by: Ben Brown <ben@demerara.io>
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
-
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index ad3655d..abd7a4c 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -37,7 +37,7 @@ escrow_PROGRAMS = plymouthd-fd-escrow
- 
- plymouthd_fd_escrow_SOURCES = plymouthd-fd-escrow.c
- 
--plymouthdrundir = $(localstatedir)/run/plymouth
-+plymouthdrundir = $(plymouthruntimedir)
- plymouthdspooldir = $(localstatedir)/spool/plymouth
- plymouthdtimedir = $(localstatedir)/lib/plymouth
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch b/meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
deleted file mode 100644
index 6a86c76d1..000000000
--- a/meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 746c690f57b52e6fe21cc2a11b5bb71d25af3128 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Wed, 13 Dec 2017 16:15:57 +0100
-Subject: [PATCH] Make full path to systemd-tty-ask-password-agent configurable
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index aad673e..6b37179 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,7 +48,10 @@ PLYMOUTH_LIBS="-lm -lrt -ldl"
- AC_SUBST(PLYMOUTH_CFLAGS)
- AC_SUBST(PLYMOUTH_LIBS)
- 
--AC_PATH_PROG([SYSTEMD_ASK_PASSWORD_AGENT], [systemd-tty-ask-password-agent])
-+AC_ARG_WITH(systemd-tty-ask-password-agent, AS_HELP_STRING([--with-systemd-tty-ask-password-agent],[path of systemd-tty-ask-password-agent]),SYSTEMD_ASK_PASSWORD_AGENT=${withval},SYSTEMD_ASK_PASSWORD_AGENT=/bin/systemd-tty-ask-password-agent)
-+AC_SUBST(SYSTEMD_ASK_PASSWORD_AGENT)
-+
-+# checked: UDEVADM is not used
- AC_PATH_PROG([UDEVADM], [udevadm])
- 
- AC_ARG_ENABLE(pango, AS_HELP_STRING([--enable-pango],[enable building with pango, disabled there is no encryption prompts]),enable_pango=$enableval,enable_pango=yes)
--- 
-2.9.5
-
diff --git a/meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch b/meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch
deleted file mode 100644
index e351098f3..000000000
--- a/meta-oe/recipes-core/plymouth/files/0001-Use-standard-runstatedir-vs-custom-flag.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 97012d2c38b84fffb32867fb5eeac64a93455626 Mon Sep 17 00:00:00 2001
-From: Ben Brown <ben@demerara.io>
-Date: Tue, 19 Jul 2022 16:10:24 +0100
-Subject: [PATCH] Use standard runstatedir vs custom flag
-
-Upstream-Status: Backport
-
----
- configure.ac | 11 ++---------
- 1 file changed, 2 insertions(+), 9 deletions(-)
-
-Signed-off-by: Ben Brown <ben@demerara.io>
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index 608ad02..34a2f2c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -140,9 +140,7 @@ if test x$enable_systemd_integration = xyes; then
-   AC_SUBST(SYSTEMD_UNIT_DIR)
- fi
- 
--AC_ARG_WITH([runtimedir],
--            AC_HELP_STRING([--with-runtimedir=DIR], [runtime data dir [LOCALSTATEDIR/run]]),
--            [plymouthruntimedir=${withval}/plymouth], [plymouthruntimedir=""])
-+AC_ARG_WITH([runtimedir], [], [AC_MSG_ERROR([--with-runtimedir is obsolete, use --runstatedir instead])], [])
- 
- AC_ARG_WITH(system-root-install, AS_HELP_STRING([--with-system-root-install],[Install client in /bin and daemon in /sbin]),with_system_root_install=${withval},with_system_root_install=no)
- AM_CONDITIONAL(WITH_SYSTEM_ROOT_INSTALL,  [test "$with_system_root_install" = yes])
-@@ -150,16 +148,11 @@ AM_CONDITIONAL(WITH_SYSTEM_ROOT_INSTALL,  [test "$with_system_root_install" = ye
- if test x$with_system_root_install = xyes; then
-   plymouthclientdir=/bin
-   plymouthdaemondir=/sbin
--  if (test -z "${plymouthruntimedir}"); then
--    plymouthruntimedir=/run/plymouth
--  fi
- else
-   plymouthclientdir=$bindir
-   plymouthdaemondir=$sbindir
--  if (test -z "${plymouthruntimedir}"); then
--    plymouthruntimedir=$localstatedir/run/plymouth
--  fi
- fi
-+plymouthruntimedir=$runstatedir/plymouth
- AC_SUBST(plymouthclientdir)
- AC_SUBST(plymouthdaemondir)
- AC_SUBST(plymouthruntimedir)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-Avoid-linking-to-plymouth_logo_file.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-Avoid-linking-to-plymouth_logo_file.patch
new file mode 100644
index 000000000..77c9fbd96
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/plymouth/0001-Avoid-linking-to-plymouth_logo_file.patch
@@ -0,0 +1,28 @@
+From 210090a8bddc4d4fae6089449306276a58db7409 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Wed, 14 Feb 2024 14:45:29 +0100
+Subject: [PATCH] Avoid linking to plymouth_logo_file
+
+Otherwise it would lead to install errors during cross-compilation.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ themes/spinfinity/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/themes/spinfinity/meson.build b/themes/spinfinity/meson.build
+index f48e8e55..da9ea705 100644
+--- a/themes/spinfinity/meson.build
++++ b/themes/spinfinity/meson.build
+@@ -56,5 +56,5 @@ install_data(
+ 
+ install_symlink('header-image.png',
+   install_dir: plymouth_theme_path / 'spinfinity',
+-  pointing_to: plymouth_logo_file,
++  pointing_to: '..' / '..'/ 'bizcom.png',
+ )
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-Drop-libdl-references.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-Drop-libdl-references.patch
new file mode 100644
index 000000000..e922f5ce9
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/plymouth/0001-Drop-libdl-references.patch
@@ -0,0 +1,70 @@
+From c1d5f8265a1974908ae8dd32714d305035939cc7 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Wed, 14 Feb 2024 12:24:44 +0100
+Subject: [PATCH] Drop libdl references
+
+dl has been integrated into libc since glibc 2.34, dont need to link to
+it any more.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ meson.build                        | 2 --
+ src/client/meson.build             | 1 -
+ src/libply-splash-core/meson.build | 1 -
+ src/libply/meson.build             | 1 -
+ 4 files changed, 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c6996aed..91688f73 100644
+--- a/meson.build
++++ b/meson.build
+@@ -24,8 +24,6 @@ cc = meson.get_compiler('c')
+ lm_dep = cc.find_library('m')
+ lrt_dep = cc.find_library('rt')
+ 
+-ldl_dep = dependency('dl')
+-
+ libpng_dep = dependency('libpng', version: '>= 1.2.16')
+ 
+ libudev_dep = dependency('libudev', required: get_option('udev'))
+diff --git a/src/client/meson.build b/src/client/meson.build
+index 0506c8b4..272a811c 100644
+--- a/src/client/meson.build
++++ b/src/client/meson.build
+@@ -52,7 +52,6 @@ pkgconfig.generate(libply_boot_client,
+   description: 'Client Library for Boot Splash',
+   libraries: [
+     libply,
+-    ldl_dep,
+   ],
+   subdirs: [
+     'plymouth-1/ply',
+diff --git a/src/libply-splash-core/meson.build b/src/libply-splash-core/meson.build
+index cd22345c..c0f62b4b 100644
+--- a/src/libply-splash-core/meson.build
++++ b/src/libply-splash-core/meson.build
+@@ -81,7 +81,6 @@ pkgconfig.generate(libply_splash_core,
+   description: 'Utility Library for Boot Splash Plugins',
+   libraries: [
+     libply,
+-    ldl_dep,
+   ],
+   subdirs: [
+     'plymouth-1/ply',
+diff --git a/src/libply/meson.build b/src/libply/meson.build
+index 70f72488..77dced75 100644
+--- a/src/libply/meson.build
++++ b/src/libply/meson.build
+@@ -17,7 +17,6 @@ libply_sources = files(
+ )
+ 
+ libply_deps = [
+-  ldl_dep,
+   lm_dep,
+ ]
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
new file mode 100644
index 000000000..a25aa3b16
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/plymouth/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
@@ -0,0 +1,63 @@
+From beb9b218f94872e70d02578d4ff016e08abc4717 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Wed, 14 Feb 2024 12:03:26 +0100
+Subject: [PATCH] Make full path to systemd-tty-ask-password-agent configurable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ meson.build               | 2 +-
+ meson_options.txt         | 5 +++++
+ systemd-units/meson.build | 2 +-
+ 3 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 26789060..c6996aed 100644
+--- a/meson.build
++++ b/meson.build
+@@ -44,7 +44,7 @@ if get_option('systemd-integration')
+   systemd_unit_dir = systemd_dep.get_variable('systemdsystemunitdir',
+     pkgconfig_define: [ 'rootprefix', get_option('prefix') ],
+   )
+-  systemd_ask_password_agent = find_program('systemd-tty-ask-password-agent')
++  systemd_ask_password_agent = get_option('systemd-tty-ask-password-agent')
+ endif
+ 
+ if get_option('upstart-monitoring')
+diff --git a/meson_options.txt b/meson_options.txt
+index 4f601bb0..aac661fc 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -53,6 +53,11 @@ option('systemd-integration',
+   value: true,
+   description: 'Coordinate boot up with systemd',
+ )
++option('systemd-tty-ask-password-agent',
++  type: 'string',
++  value: '/bin/systemd-tty-ask-password-agent',
++  description: 'Path of systemd-tty-ask-password-agent',
++)
+ option('udev',
+   type: 'feature',
+   value: 'auto',
+diff --git a/systemd-units/meson.build b/systemd-units/meson.build
+index 06379312..7adc86ae 100644
+--- a/systemd-units/meson.build
++++ b/systemd-units/meson.build
+@@ -21,7 +21,7 @@ foreach unit_templ : systemd_unit_templates
+       'PLYMOUTH_CLIENT_DIR': get_option('prefix') / get_option('bindir'),
+       'PLYMOUTH_DAEMON_DIR': get_option('prefix') / get_option('sbindir'),
+       'plymouthruntimedir': plymouth_runtime_dir,
+-      'SYSTEMD_ASK_PASSWORD_AGENT': systemd_ask_password_agent.full_path(),
++      'SYSTEMD_ASK_PASSWORD_AGENT': systemd_ask_password_agent,
+     },
+     install: true,
+     install_dir: systemd_unit_dir,
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-Make-themes-build-optional.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-Make-themes-build-optional.patch
new file mode 100644
index 000000000..ab9aa7c39
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/plymouth/0001-Make-themes-build-optional.patch
@@ -0,0 +1,120 @@
+From 2caf68370791c7aa48f94628c7f7a012753388c5 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Wed, 14 Feb 2024 15:07:00 +0100
+Subject: [PATCH] Make themes build optional
+
+The users can choose which themes should be built.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ meson_options.txt  | 50 ++++++++++++++++++++++++++++++++++++++++++++++
+ themes/meson.build | 38 ++++++++++++++++++++++++++---------
+ 2 files changed, 79 insertions(+), 9 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 4f601bb0..1cbf6d2b 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -83,3 +83,53 @@ option('docs',
+   value: true,
+   description: 'Build documentation',
+ )
++option('spinfinity-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with spinfinity theme',
++)
++option('fade-in-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with fade-in theme',
++)
++option('text-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with text theme',
++)
++option('details-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with details theme',
++)
++option('solar-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with solar theme',
++)
++option('glow-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with glow theme',
++)
++option('script-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with script theme',
++)
++option('spinner-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with spinner theme',
++)
++option('tribar-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with tribar theme',
++)
++option('bgrt-theme',
++  type: 'boolean',
++  value: true,
++  description: 'Build with bgrt theme',
++)
+diff --git a/themes/meson.build b/themes/meson.build
+index dc2ca6e2..15918472 100644
+--- a/themes/meson.build
++++ b/themes/meson.build
+@@ -1,10 +1,30 @@
+-subdir('spinfinity')
+-subdir('fade-in')
++if get_option('spinfinity-theme')
++    subdir('spinfinity')
++endif
++if get_option('fade-in-theme')
++    subdir('fade-in')
++endif
++if get_option('text-theme')
+ subdir('text')
+-subdir('details')
+-subdir('solar')
+-subdir('glow')
+-subdir('script')
+-subdir('spinner')
+-subdir('tribar')
+-subdir('bgrt')
++endif
++if get_option('details-theme')
++    subdir('details')
++endif
++if get_option('solar-theme')
++    subdir('solar')
++endif
++if get_option('glow-theme')
++    subdir('glow')
++endif
++if get_option('script-theme')
++    subdir('script')
++endif
++if get_option('spinner-theme')
++    subdir('spinner')
++endif
++if get_option('tribar-theme')
++    subdir('tribar')
++endif
++if get_option('bgrt-theme')
++    subdir('bgrt')
++endif
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-splash-option.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-Add-the-retain-splash-option.patch
similarity index 100%
rename from meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-splash-option.patch
rename to meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-Add-the-retain-splash-option.patch
diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-start-service-in-add-related-kernel-paramet.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.patch
similarity index 100%
rename from meta-oe/recipes-core/plymouth/files/0001-plymouth-start-service-in-add-related-kernel-paramet.patch
rename to meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.patch
diff --git a/meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb b/meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb
deleted file mode 100644
index 469914cd4..000000000
--- a/meta-oe/recipes-core/plymouth/plymouth_22.02.122.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "Plymouth is a project from Fedora providing a flicker-free graphical boot process."
-DESCRIPTION = "Plymouth is an application that runs very early in the boot process \
-(even before the root filesystem is mounted!) that provides a \
-graphical boot animation while the boot process happens in the background."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/Plymouth"
-SECTION = "base"
-
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = " \
-    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
-    file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
-    file://0001-plymouth-start-service-in-add-related-kernel-paramet.patch \
-    file://0001-plymouth-Add-the-retain-splash-option.patch \
-    file://0001-Use-standard-runstatedir-vs-custom-flag.patch \
-    file://0001-Fix-daemon-install-ignoring-configured-runstatedir.patch \
-"
-
-SRC_URI[sha256sum] = "100551442221033ce868c447ad6c74d831d209c18ae232b98ae0207e34eadaeb"
-
-LOGO ??= "${datadir}/plymouth/bizcom.png"
-RUNSTATEDIR ??= "${localstatedir}/run"
-
-EXTRA_OECONF = "--runstatedir=${RUNSTATEDIR}"
-
-PACKAGECONFIG ??= "initrd logo pango udev ${@bb.utils.filter('DISTRO_FEATURES', 'systemd usrmerge', d)}"
-PACKAGECONFIG:append:x86 = " drm"
-PACKAGECONFIG:append:x86-64 = " drm"
-
-PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
-PACKAGECONFIG[documentation] = "--enable-documentation,--disable-documentation"
-PACKAGECONFIG[initrd] = ",,"
-PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-PACKAGECONFIG[logo] = "--with-logo=${LOGO},--without-logo"
-PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
-PACKAGECONFIG[systemd] = "--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent,--disable-systemd-integration,systemd"
-PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev"
-PACKAGECONFIG[upstart-monitoring] = "--enable-upstart-monitoring,--disable-upstart-monitoring,ncurses dbus"
-PACKAGECONFIG[usrmerge] = "--without-system-root-install,--with-system-root-install"
-
-inherit autotools pkgconfig systemd gettext
-
-do_install:append() {
-    # Remove /var/run from package as plymouth will populate it on startup
-    rm -fr ${D}${RUNSTATEDIR}
-
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
-        rm -rf "${D}${libexecdir}"
-    fi
-}
-
-PROVIDES = "virtual/psplash"
-RPROVIDES:${PN} = "virtual-psplash virtual-psplash-support"
-
-PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
-PACKAGES =+ "${PN}-set-default-theme"
-
-FILES:${PN}-initrd = "${libexecdir}/plymouth/*"
-FILES:${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
-
-FILES:${PN} += "${systemd_unitdir}/system/*"
-FILES:${PN}-dbg += "${libdir}/plymouth/renderers/.debug"
-
-DEPENDS = "libcap libpng"
-DEPENDS:append:libc-musl = " musl-rpmatch"
-
-LDFLAGS:append:libc-musl = " -lrpmatch"
-
-RDEPENDS:${PN}-initrd = "bash dracut"
-RDEPENDS:${PN}-set-default-theme = "bash"
-
-SYSTEMD_SERVICE:${PN} = "plymouth-start.service"
diff --git a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb b/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
new file mode 100644
index 000000000..cdf24477a
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
@@ -0,0 +1,102 @@
+SUMMARY = "Plymouth is a project from Fedora providing a flicker-free graphical boot process."
+DESCRIPTION = "Plymouth is an application that runs very early in the boot process \
+(even before the root filesystem is mounted!) that provides a \
+graphical boot animation while the boot process happens in the background."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/Plymouth"
+SECTION = "base"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = " \
+    http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
+    file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
+    file://0001-plymouth-start-service-in-add-related-kernel-paramet.patch \
+    file://0001-plymouth-Add-the-retain-splash-option.patch \
+    file://0001-Drop-libdl-references.patch \
+    file://0001-Avoid-linking-to-plymouth_logo_file.patch \
+    file://0001-Make-themes-build-optional.patch \
+"
+
+SRC_URI[sha256sum] = "f3f7841358c98f5e7b06a9eedbdd5e6882fd9f38bbd14a767fb083e3b55b1c34"
+
+PLYMOUTH_RUNSTATEDIR ??= "${base_prefix}/run"
+PLYMOUTH_RELEASE_FILE ??= "${sysconfdir}/system-release"
+
+PLYMOUTH_BACKGROUND_COLOR ??= "0x5d5950"
+PLYMOUTH_BACKGROUND_START_COLOR_STOP ??= "0x807c71"
+PLYMOUTH_BACKGROUND_END_COLOR_STOP ??= "0x3a362f"
+
+PLYMOUTH_BOOT_TTY ??= "/dev/tty1"
+PLYMOUTH_SHUTDOWN_TTY ??= "/dev/tty63"
+
+PLYMOUTH_THEMES ??= "spinfinity fade-in text details solar glow script spinner tribar bgrt"
+
+EXTRA_OEMESON += " \
+    -Drunstatedir=${PLYMOUTH_RUNSTATEDIR} \
+    -Drelease-file=${PLYMOUTH_RELEASE_FILE} \
+    -Dbackground-color=${PLYMOUTH_BACKGROUND_COLOR} \
+    -Dbackground-start-color-stop=${PLYMOUTH_BACKGROUND_START_COLOR_STOP} \
+    -Dbackground-end-color-stop=${PLYMOUTH_BACKGROUND_END_COLOR_STOP} \
+    -Dboot-tty=${PLYMOUTH_BOOT_TTY} \
+    -Dshutdown-tty=${PLYMOUTH_SHUTDOWN_TTY} \
+"
+
+PACKAGECONFIG ??= "initrd freetype pango udev ${PLYMOUTH_THEMES} ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG:append:x86 = " drm"
+PACKAGECONFIG:append:x86-64 = " drm"
+
+PACKAGECONFIG[drm] = "-Ddrm=true,-Ddrm=false,libdrm"
+PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false"
+PACKAGECONFIG[freetype] = "-Dfreetype=enabled,-Dfreetype=disabled,freetype"
+PACKAGECONFIG[initrd] = ",,"
+PACKAGECONFIG[gtk] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
+PACKAGECONFIG[pango] = "-Dpango=enabled,-Dpango=disabled,pango cairo"
+PACKAGECONFIG[systemd] = "-Dsystemd-integration=true ,-Dsystemd-integration=false,systemd"
+PACKAGECONFIG[tracing] = "-Dtracing=true,-Dtracing=false"
+PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
+PACKAGECONFIG[upstart-monitoring] = "-Dupstart-monitoring=true,-Dupstart-monitoring=false,ncurses dbus"
+
+# theme configs
+PACKAGECONFIG[spinfinity] = "-Dspinfinity-theme=true,-Dspinfinity-theme=false"
+PACKAGECONFIG[fade-in] = "-Dfade-in-theme=true,-Dfade-in-theme=false"
+PACKAGECONFIG[text] = "-Dtext-theme=true,-Dtext-theme=false"
+PACKAGECONFIG[details] = "-Ddetails-theme=true,-Ddetails-theme=false"
+PACKAGECONFIG[solar] = "-Dsolar-theme=true,-Dsolar-theme=false"
+PACKAGECONFIG[glow] = "-Dglow-theme=true,-Dglow-theme=false"
+PACKAGECONFIG[script] = "-Dscript-theme=true,-Dscript-theme=false"
+PACKAGECONFIG[spinner] = "-Dspinner-theme=true,-Dspinner-theme=false"
+PACKAGECONFIG[tribar] = "-Dtribar-theme=true,-Dtribar-theme=false"
+PACKAGECONFIG[bgrt] = "-Dbgrt-theme=true,-Dbgrt-theme=false"
+
+inherit meson pkgconfig systemd gettext
+
+do_install:append() {
+    # Remove ${PLYMOUTH_RUNSTATEDIR} from package as plymouth will populate it on startup
+    rm -fr ${D}${PLYMOUTH_RUNSTATEDIR}
+
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
+        rm -rf "${D}${libexecdir}"
+    fi
+}
+
+PROVIDES = "virtual/psplash"
+RPROVIDES:${PN} = "virtual-psplash virtual-psplash-support"
+
+PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
+PACKAGES =+ "${PN}-set-default-theme"
+
+FILES:${PN}-initrd = "${libexecdir}/plymouth/*"
+FILES:${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
+
+FILES:${PN} += "${systemd_unitdir}/system/*"
+
+DEPENDS = "libcap libpng libxkbcommon xkeyboard-config libevdev"
+DEPENDS:append:libc-musl = " musl-rpmatch"
+
+LDFLAGS:append:libc-musl = " -lrpmatch"
+
+RDEPENDS:${PN}-initrd = "bash dracut"
+RDEPENDS:${PN}-set-default-theme = "bash"
+
+SYSTEMD_SERVICE:${PN} = "plymouth-start.service"
-- 
2.34.1


