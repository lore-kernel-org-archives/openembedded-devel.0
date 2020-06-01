Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.48706.1591047966104045040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NT6jxuHn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id j198so873552wmj.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jN0KS7U4o93ia8cuDH/oHR/rN8YiScO53kHd2Pt8rWc=;
        b=NT6jxuHnQl+8i9zL0/cYWsQad82qwctqB4t+9jdJIRUDbcODtIcGvWpqdOTJa7WXVW
         O0+5UJHcdPAeI8QUhOBXLtaMtLWN/MzuO3thL4R+3NHfjj53Wlaid9GmkeSz5qRFXJoZ
         H0za7bj1ZvZ4dGbAHPNnZyGzkyH+6Uv7+/eouq9AdPvjdpDVBX2wgzpNAGOB3v1veuXf
         2iksSt01k7MuoMVwkGbN1ZM91Hq19IPm+TI9nDoyzNIgnNNqf8aRjNkoZldVC979hkJm
         17f0eZ6qR6DXEVtny2ewcImCAw+CJhBvctXUGDWLEODEK6Hduxp+WS8TZyl+sLNdIa+P
         vUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jN0KS7U4o93ia8cuDH/oHR/rN8YiScO53kHd2Pt8rWc=;
        b=T2BELZgG1ZPUO0VJ7IttD3n7JSEKSvExJn0ChSDOIetax865EfNdH3wyWiIQgWb1Gp
         jxmYwWrRm75Ee4dG0RwBTQvzP+4ez2cqJuXWFPSusMHt536r0Gs79BXX8bgxtOCAOwHU
         70ECRI7sOUhMhIv2BrtYb3tMhcOYtmbs3tmE2lAGmflex34lBborY7LA+fMKcRdo8Re1
         rqbqiBsjbubRtHSgOTWhJiyGxlyMrLh6yQ4Nuqyep5NLFpl/oMJjpsKXNQ+T0EUTotBR
         qQxuDJh8a33H9BK0gUvUP5BmjAcZAKh6lRxzBQdaSQtjdYRBZZvDPvddLbNxM8lcSkXO
         ACnA==
X-Gm-Message-State: AOAM531Ovhj/rgW9VhZ4wo2kjfr5i22lGQLbKKSWkOApg519hTrsiw4A
	Y8hYkQma3gFUuASpVd3r9mXvnxB6714=
X-Google-Smtp-Source: ABdhPJwvWqeraRuH1XJEQ72M7H6CdXSmlWR4ns1un5r4HNJ5fxwL+cPxNOgWgki7Nknbk5NpKlxaxA==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr1152718wml.188.1591047964188;
        Mon, 01 Jun 2020 14:46:04 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.46.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:46:03 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 37/38] sysprof: upgrade 3.34.1 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:15 +0200
Message-Id: <20200601214516.26624-38-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Move recipe recipes-kernel ->  recipes-gnome
* 0001-libsysprof-ui-Rename-environ-to-sys_environ.patch can go: upstream did
  raname variable differently
* We can build help files these days
* reworder patches / recipe cleanup

Overview of changes in Sysprof 3.36.0
=====================================

 * Preload library has been moved to $libdir from $libexecdir
 * Build system improvements
 * Fix whole-system capture setting when using "Record Again" feature
 * New SysprofCollector interfaces for samples, marks, and logs to
   sit alongside allocations
 * Translation updates

Overview of changes in Sysprof 3.35.92
======================================

 * A new profiler for tracking memory allocations within processes
   that are spawned by Sysprof. Select "Track Allocations" to use
   an LD_PRELOAD module which monitors allocations within the target
   process. A callgraph is provided with allocations and their stack
   traces. This brings the main features of the venerable "Memprof"
   into Sysprof.
 * Port Sysprof to work on RHEL 7
 * Improvements to marks and counters displays
 * A new data frame in libsysprof-capture for memory allocations
   with stack traces.
 * sysprof-cli --merge can now be used to merge multiple syscap
   files together.
 * sysprof <program-path> can now be used to open Sysprof directly
   to a program to execute.
 * Sysprof now builds with additional security protections and
   optimization flags such as -Bsymbolic, -Wl,-z,defs, -Wl,-z,now,
   and -Wl,-z,relro.
 * Fixes for macOS
 * The ELF symbol resolver is faster
 * sysprof-cli now properly adds supplemental information to the
   capture file such as decoded symbols. This makes sharing syscap
   files across machines easier and more reliable.
 * A new mmap()'d ring buffer can be shared between processes for
   faster data transfer to sysprof. We expect more features around
   this SysprofCollector interface in future releases.
 * A new set if icons has been provided for the collectors
 * Translation updates

Overview of changes in Sysprof 3.35.2
=====================================

 * Build and test fixes
 * Track changes to gdbus-codegen
 * Include additional pkg-config variable for access to D-Bus data
 * Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-Define-NT_GNU_BUILD_ID-if-undefined.patch |  0
 ...t-hardcode-linux-as-host_machine-.s.patch} |  2 +-
 ...E_FORMAT-instead-of-G_GUINT64_FORMAT.patch | 31 +++++++++
 .../sysprof/sysprof_3.36.0.bb}                | 39 +++++++-----
 ...rof-ui-Rename-environ-to-sys_environ.patch | 63 -------------------
 5 files changed, 54 insertions(+), 81 deletions(-)
 rename meta-gnome/{recipes-kernel/sysprof/files => recipes-gnome/sysprof/sysprof}/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch (100%)
 rename meta-gnome/{recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch => recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch} (99%)
 create mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
 rename meta-gnome/{recipes-kernel/sysprof/sysprof_3.34.1.bb => recipes-gnome/sysprof/sysprof_3.36.0.bb} (50%)
 delete mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch

diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
similarity index 100%
rename from meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
rename to meta-gnome/recipes-gnome/sysprof/sysprof/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
similarity index 99%
rename from meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
rename to meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
index 235489226..9db111e8e 100644
--- a/meta-gnome/recipes-kernel/sysprof/files/0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
@@ -19,7 +19,7 @@ index 3449961..3c2d186 100644
 --- a/src/libsysprof/meson.build
 +++ b/src/libsysprof/meson.build
 @@ -84,7 +84,7 @@ libsysprof_deps = [
-   polkit_dep,
+   librax_dep,
  ]
  
 -if host_machine.system() == 'linux'
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
new file mode 100644
index 000000000..d8fffbb7e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
@@ -0,0 +1,31 @@
+From 5dea152c7728f5a37370ad8a229115833e36b4f6 Mon Sep 17 00:00:00 2001
+From: Rasmus Thomsen <oss@cogitri.dev>
+Date: Sat, 7 Mar 2020 10:44:16 +0100
+Subject: [PATCH] tests: use G_GSIZE_FORMAT instead of G_GUINT64_FORMAT for
+ gsize
+
+This fixes the build on 32-bit platforms with -Werror-format
+
+fixes #32
+
+Upstream-Status: Applied[https://gitlab.gnome.org/GNOME/sysprof/-/commit/5dea152c7728f5a37370ad8a229115833e36b4f6]
+---
+ src/tests/allocs-by-size.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tests/allocs-by-size.c b/src/tests/allocs-by-size.c
+index 666113a..6260d4b 100644
+--- a/src/tests/allocs-by-size.c
++++ b/src/tests/allocs-by-size.c
+@@ -109,7 +109,7 @@ allocs_by_size (SysprofCaptureReader *reader)
+     {
+       const Item *item = &g_array_index (ar, Item, i);
+ 
+-      g_print ("%"G_GUINT64_FORMAT",%"G_GUINT64_FORMAT",%"G_GUINT64_FORMAT"\n",
++      g_print ("%"G_GSIZE_FORMAT",%"G_GSIZE_FORMAT",%"G_GSIZE_FORMAT"\n",
+                item->size, item->cmp, item->count);
+     }
+ }
+-- 
+2.21.3
+
diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
similarity index 50%
rename from meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
index ad69ab68c..a769dbf7d 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
@@ -5,24 +5,29 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext systemd upstream-version-is-even gsettings mime mime-xdg
-
-DEPENDS += "glib-2.0 libxml2-native glib-2.0-native"
-
-SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
-SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
-SRC_URI += "file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
-            file://0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch \
-            file://0001-libsysprof-ui-Rename-environ-to-sys_environ.patch \
-            "
+inherit gnomebase gnome-help gettext systemd upstream-version-is-even gsettings mime mime-xdg
+
+DEPENDS += " \
+    glib-2.0-native \
+    yelp-tools-native \
+    libxml2-native \
+    glib-2.0 \
+"
+
+SRC_URI[archive.md5sum] = "3956e82b8744715006dde59e0ce8910b"
+SRC_URI[archive.sha256sum] = "8670db4dacf7b219d30c575c465b17c8ed6724dbade347f2cde9548bff039108"
+SRC_URI += " \
+    file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
+    file://0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch \
+    file://0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch \
+"
 
 PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
 PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
 PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
 
-# Enablig this requries yelp
-EXTRA_OEMESON += "-Dhelp=false -Dsystemdunitdir=${systemd_unitdir}/system"
+EXTRA_OEMESON += "-Dsystemdunitdir=${systemd_unitdir}/system"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
@@ -30,8 +35,8 @@ FILES_SOLIBSDEV = ""
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service sysprof3.service', '', d)}"
 
 FILES_${PN} += " \
-               ${datadir}/dbus-1/system-services \
-               ${datadir}/dbus-1/system.d \
-               ${datadir}/dbus-1/interfaces \
-               ${datadir}/metainfo \
-               "
+    ${datadir}/dbus-1/system-services \
+    ${datadir}/dbus-1/system.d \
+    ${datadir}/dbus-1/interfaces \
+    ${datadir}/metainfo \
+"
diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch
deleted file mode 100644
index 1e2b3c92b..000000000
--- a/meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 4bd0d5d5dd6841fbac8385527617d18e7731244d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Jan 2020 13:17:58 -0800
-Subject: [PATCH] libsysprof-ui: Rename environ to sys_environ
-
-This helps avoid namesapace conflict with glibc headers
-
-Fixes
-/usr/include/unistd.h:545:15: note: previous declaration is here
-
-extern char **environ;
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libsysprof-ui/sysprof-profiler-assistant.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/libsysprof-ui/sysprof-profiler-assistant.c b/src/libsysprof-ui/sysprof-profiler-assistant.c
-index 22e3e24..c55d551 100644
---- a/src/libsysprof-ui/sysprof-profiler-assistant.c
-+++ b/src/libsysprof-ui/sysprof-profiler-assistant.c
-@@ -235,7 +235,7 @@ sysprof_profiler_assistant_record_clicked_cb (SysprofProfilerAssistant *self,
-     {
-       g_auto(GStrv) argv = NULL;
-       g_auto(GStrv) env = NULL;
--      SysprofEnviron *environ;
-+      SysprofEnviron *sys_environ;
-       const gchar *command;
-       gint argc;
- 
-@@ -245,8 +245,8 @@ sysprof_profiler_assistant_record_clicked_cb (SysprofProfilerAssistant *self,
-       sysprof_profiler_set_spawn (profiler, TRUE);
-       sysprof_profiler_set_spawn_argv (profiler, (const gchar * const *)argv);
- 
--      environ = sysprof_environ_editor_get_environ (self->environ_editor);
--      env = sysprof_environ_get_environ (environ);
-+      sys_environ = sysprof_environ_editor_get_environ (self->environ_editor);
-+      env = sysprof_environ_get_environ (sys_environ);
-       sysprof_profiler_set_spawn_env (profiler, (const gchar * const *)env);
- 
-       sysprof_profiler_set_spawn_inherit_environ (profiler,
-@@ -405,7 +405,7 @@ sysprof_profiler_assistant_class_init (SysprofProfilerAssistantClass *klass)
- static void
- sysprof_profiler_assistant_init (SysprofProfilerAssistant *self)
- {
--  g_autoptr(SysprofEnviron) environ = sysprof_environ_new ();
-+  g_autoptr(SysprofEnviron) sys_environ = sysprof_environ_new ();
- 
-   gtk_widget_init_template (GTK_WIDGET (self));
- 
-@@ -445,7 +445,7 @@ sysprof_profiler_assistant_init (SysprofProfilerAssistant *self)
-                            self,
-                            G_CONNECT_SWAPPED);
- 
--  sysprof_environ_editor_set_environ (self->environ_editor, environ);
-+  sysprof_environ_editor_set_environ (self->environ_editor, sys_environ);
- }
- 
- void
--- 
-2.25.0
-
-- 
2.21.3

