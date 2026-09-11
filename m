Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2AC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:05 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40460.1789136281390972164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hH0UPboH;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso1019116a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136281; x=1789741081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfMn2B1KnFC9wKMzv5L27zNPBV5Ft3muxWdtG77H6FY=;
        b=hH0UPboHYcQLm1xACmkqjrFfl8rWTmrkFnnuZ9+m0pchWu3rzd6XCFLeE+7AzFsKMd
         V5IhyufPC/nIN2N+bVDXiTAkoTemiZDZh/m1eb1XzYonI0tj6iGELmVmop47hMMyy5gT
         Htzc2maurDYJHy2Hn4a+kxu8qKYWopsOqr8XbgTGWjavx2e70dFFTqeBtrLc3xFWGvSP
         k3nXOZvC5vJXn2F6rnd4z4YbSl8pqEtTGmqbBOkJeRrvgK0CcBK7LScbpav7lINn3r79
         STe1pxBEdNIawtS4mPteDlCSeOitnVbpNEYob3QLk++8D6McqBIzARDDOIcE4dLRLj2L
         gSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136281; x=1789741081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfMn2B1KnFC9wKMzv5L27zNPBV5Ft3muxWdtG77H6FY=;
        b=kmKNTI6Ec5138rPQ9oiEvxsIKels0KcVCjCIVWmTCxalEZF0gA+/YTCtBKlRNlzsac
         nSih8K5M+IpO05z6poGPbQjy/qreY/363WPqqzAO6WA/CtrB+dqaaMsVLcdBSpzPf+QT
         qjdDMwNtWW8hZXXzvF0g/rCLzgYiL1hf1wqh1MuQZvqLXcwy2dMnSGRlk9WRjOefU33b
         COL7onzeAHtrESP6aRmE+DmqqRzYPvfYMT/UW7jHvi4i1aT/yXd9AkoOtzMHbPkhNZHS
         3iGlEN2pVjrLNApBYxDsxooISBt8jAo8kP7uho+wxolO+lVNIVrSFz6x4DXyqla3h1+H
         4DYg==
X-Gm-Message-State: AFuF++l4Cu5YZcvDDDjQbEZKDY0vm15jbuJGP+5alq9tlZcT6vvJgYmT
	ue+h5GVXyEOJblyemYaCELhJBI4DreXWnHiQryQuRVW87eopYcyOMHDCRdtpIg==
X-Gm-Gg: AYBFou3MvRvmz4hMxBOh8MwZI1hMED3zCAGFIYcNDWgU9O1Y7duMMZ0wJTJgzh+oLQk
	EX/WKqj7l19Al9pToJooRHxY763b4EYlwAYeKcBvS8rR0tIczvdlFbEGGOkMSboUizeNJVXHIYN
	natarWXPERjoG44BVPm8CeojRm+pqnWNuJVYJxwkXK2e4LL9ZFalv5hKLRlmS9eqe97yrQTtSCi
	HzgPe8Qcr1APgGUNNRixpLfIPBQnjM3BsvQ3VkRr8L5DSkMo7l3FTX9OZrtQZDS+/Ggipm6jL1V
	ke7VYr+KLmmWYjaiOMT+1MTVIPMhUgTxA+vN0plpklVEJsy3nK+NdmiZN84tQ+uGX3SbQD3BOBZ
	xqeKINHdid0Zx946VgtaVKBisZo4655tEj0y3sAt6S8jP5KEva5GrRGvFXUAGUUI6WHQzZDqc6J
	eNXk7VbV1RJEZr6GpbM6pYjsGTauU6LlEhs/9NNc2WEeAyXCvs7BLoTj3oMXHbg6AoT/dlHiuCo
	mT7F+GRZEPq5hlc+KGaSgDYfqB5NqiR/4pDDbrYGTncOBJ5qi50oILfgSqg77SdhQBEKzTYa7Ga
	WWvglB/X3lZE7PHxadXiprujTHWmdLNyDqsX/auDXbOsczRzKCal9zOzQH6plbyjjrxoPoSYGCn
	9RIzXdXOPFru6sg3Uiykzm9qfzLfwKIlbiApzHyv5GA==
X-Received: by 2002:a17:90b:4fc2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39d9bc42d1bmr8546157a91.6.1789136280495;
        Fri, 11 Sep 2026 07:18:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/7] gnome-disk-utility: fix build without x11 in DISTRO_FEATURES
Date: Fri, 11 Sep 2026 07:17:51 -0700
Message-ID: <20260911141756.2275517-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
References: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129966

gnome-disk-utility 46.1 fails to build on a wayland-only distro
configuration (no x11 in DISTRO_FEATURES) for three separate reasons,
all of them latent X11 assumptions in the GTK3 code line.

do_configure fails first:

  Run-time dependency libcanberra-gtk3 found: NO (tried pkg-config)
  meson.build:75:18: ERROR: Dependency "libcanberra-gtk3" not found

meson.build requires libcanberra-gtk3 unconditionally, but
libcanberra's gtk3 support is itself X11-only (its configure.ac does
PKG_CHECK_MODULES(GTK3, [gtk+-3.0 ... gdk-3.0 x11]), the sources use
gdk_x11_get_xatom_by_name_for_display()/GDK_WINDOW_XID, and
libcanberra-gtk3.pc links -lX11), so the meta-oe recipe correctly
leaves the gtk3 PACKAGECONFIG off here and the dependency can never be
satisfied. Drop it, along with the three ca_gtk_play_for_widget() sound
effect call sites; upstream removed libcanberra entirely by the same
route after 46.1 was released.

Once that is out of the way do_compile fails on the X11 backend header:

  gdupasswordstrengthwidget.c:14:10: fatal error: 'gdk/gdkx.h' file not found
  gduvolumegrid.c:14:10: fatal error: 'gdk/gdkx.h' file not found
  gduestimator.c:14:10: fatal error: 'gdk/gdkx.h' file not found

gtk+3 only installs gdk/gdkx.h when its X11 backend is enabled. None of
these three files calls any X11-specific GDK API, so the include is
simply dead weight and can be dropped.

Neither fix is available upstream for this code line: the GTK4 /
libadwaita rewrite deleted or renamed the affected files rather than
fixing them, and no in-flight merge request touches the GTK3 sources
that 46.1 still builds. 46.1 remains the latest stable release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Drop-the-libcanberra-gtk3-dependency.patch | 122 ++++++++++++++++++
 ...s-drop-the-unused-gdk-gdkx.h-include.patch |  68 ++++++++++
 .../gnome-disk-utility_46.1.bb                |   5 +-
 3 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch
 create mode 100644 meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch

diff --git a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch
new file mode 100644
index 0000000000..a7a4ed6d5f
--- /dev/null
+++ b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-Drop-the-libcanberra-gtk3-dependency.patch
@@ -0,0 +1,122 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Sep 2026 06:00:00 +0000
+Subject: [PATCH] Drop the libcanberra-gtk3 dependency
+
+libcanberra-gtk3 links -lX11 and its gtk3 module is built only when
+X11 is enabled (configure.ac gates HAVE_GTK3 on `gdk-3.0 x11`), so it
+is unavailable on wayland-only distro configurations. That makes
+gnome-disk-utility's hard `dependency('libcanberra-gtk3', ...)` fail
+at meson configure time there:
+
+  Run-time dependency libcanberra-gtk3 found: NO (tried pkg-config)
+  ../gnome-disk-utility-46.1/meson.build:75:18: ERROR: Dependency
+  "libcanberra-gtk3" not found (tried pkg-config)
+
+Upstream reached the same conclusion and dropped libcanberra
+entirely ahead of the GTK4/libadwaita port (GNOME/gnome-disk-utility!
+efa67dc5, !ecdd9c37, !ec6d8018), disabling the three sound-effect call
+sites and removing the dependency; that work landed after 46.1, the
+last stable release, so backport the same, minimal change here rather
+than carrying libcanberra-gtk3 as a hard requirement.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-disk-utility/-/commit/ec6d801899e440245319cdbb06555783b72808d1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build                                    |  1 -
+ src/disks/gducreatediskimagedialog.c           | 12 ++++--------
+ src/disks/gdurestorediskimagedialog.c          |  8 +++-----
+ src/disks/meson.build                          |  1 -
+ 4 files changed, 7 insertions(+), 15 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 1111111..2222222 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,7 +72,6 @@ dvdread_dep = dependency('dvdread', version: '>= 4.2.0')
+ gio_unix_dep = dependency('gio-unix-2.0', version: '>= 2.31.0')
+ gmodule_dep = dependency('gmodule-2.0')
+ gtk_dep = dependency('gtk+-3.0', version: '>= 3.16.0')
+-libcanberra_dep = dependency('libcanberra-gtk3', version: '>= 0.1')
+ # Keep the version here synchronised with subprojects/libhandy.wrap
+ libhandy_dep = dependency('libhandy-1', version: '>= 1.5.0', fallback: ['libhandy', 'libhandy_dep'])
+ liblzma_dep = dependency('liblzma', version: '>= 5.0.5')
+diff --git a/src/disks/gducreatediskimagedialog.c b/src/disks/gducreatediskimagedialog.c
+index 1111111..2222222 100644
+--- a/src/disks/gducreatediskimagedialog.c
++++ b/src/disks/gducreatediskimagedialog.c
+@@ -20,8 +20,6 @@
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
+
+-#include <canberra-gtk.h>
+-
+ #include "gduapplication.h"
+ #include "gduwindow.h"
+ #include "gducreatediskimagedialog.h"
+@@ -304,10 +302,9 @@ play_read_error_sound (DialogData *data)
+    * CA_PROP_EVENT_DESCRIPTION
+    */
+   sound_message = _("Disk image read error");
+-  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
+-                          CA_PROP_EVENT_ID, "dialog-warning",
+-                          CA_PROP_EVENT_DESCRIPTION, sound_message,
+-                          NULL);
++  /* libcanberra-gtk3 is X11-only and unavailable on wayland-only builds;
++   * disabled upstream too (GNOME!ec6d8018) ahead of the GTK4 port. */
++  (void) sound_message;
+ }
+
+ /* ---------------------------------------------------------------------------------------------------- */
+@@ -407,10 +404,9 @@ play_complete_sound (DialogData *data)
+
+   /* Translators: A descriptive string for the 'complete' sound, see CA_PROP_EVENT_DESCRIPTION */
+   sound_message = _("Disk image copying complete");
+-  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
+-                          CA_PROP_EVENT_ID, "complete",
+-                          CA_PROP_EVENT_DESCRIPTION, sound_message,
+-                          NULL);
++  /* libcanberra-gtk3 is X11-only and unavailable on wayland-only builds;
++   * disabled upstream too (GNOME!ec6d8018) ahead of the GTK4 port. */
++  (void) sound_message;
+ }
+
+ /* ---------------------------------------------------------------------------------------------------- */
+diff --git a/src/disks/gdurestorediskimagedialog.c b/src/disks/gdurestorediskimagedialog.c
+index 1111111..2222222 100644
+--- a/src/disks/gdurestorediskimagedialog.c
++++ b/src/disks/gdurestorediskimagedialog.c
+@@ -16,8 +16,6 @@
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
+
+-#include <canberra-gtk.h>
+-
+ #include "gduapplication.h"
+ #include "gduwindow.h"
+ #include "gdurestorediskimagedialog.h"
+@@ -610,10 +608,9 @@ play_complete_sound (DialogData *data)
+
+   /* Translators: A descriptive string for the 'complete' sound, see CA_PROP_EVENT_DESCRIPTION */
+   sound_message = _("Disk image copying complete");
+-  ca_gtk_play_for_widget (GTK_WIDGET (data->dialog), 0,
+-                          CA_PROP_EVENT_ID, "complete",
+-                          CA_PROP_EVENT_DESCRIPTION, sound_message,
+-                          NULL);
++  /* libcanberra-gtk3 is X11-only and unavailable on wayland-only builds;
++   * disabled upstream too (GNOME!ec6d8018) ahead of the GTK4 port. */
++  (void) sound_message;
+
+   if (data->inhibit_cookie > 0)
+     {
+diff --git a/src/disks/meson.build b/src/disks/meson.build
+index 1111111..2222222 100644
+--- a/src/disks/meson.build
++++ b/src/disks/meson.build
+@@ -83,7 +83,6 @@ deps = [
+   dvdread_dep,
+   gio_unix_dep,
+   gmodule_dep,
+-  libcanberra_dep,
+   libgdu_dep,
+   libhandy_dep,
+   liblzma_dep,
diff --git a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch
new file mode 100644
index 0000000000..d74bd7a5b9
--- /dev/null
+++ b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-disks-drop-the-unused-gdk-gdkx.h-include.patch
@@ -0,0 +1,68 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Sep 2026 06:40:00 +0000
+Subject: [PATCH] disks: drop the unused gdk/gdkx.h include
+
+gdupasswordstrengthwidget.c, gduvolumegrid.c and gduestimator.c all
+pull in <gdk/gdkx.h>, GDK's X11 backend header, but none of them call
+any X11-specific GDK API (no gdk_x11_*, no GDK_WINDOW_XID, nothing).
+The include is dead weight left over from history.
+
+On a wayland-only build (no x11 in DISTRO_FEATURES) the GTK3 recipe is
+configured without its X11 backend, so gdk/gdkx.h isn't installed into
+the sysroot at all, and do_compile fails:
+
+  gdupasswordstrengthwidget.c:14:10: fatal error: 'gdk/gdkx.h' file not found
+  gduvolumegrid.c:14:10: fatal error: 'gdk/gdkx.h' file not found
+  gduestimator.c:14:10: fatal error: 'gdk/gdkx.h' file not found
+
+Drop the unused include from all three files so the GTK3 build works
+regardless of whether the X11 backend is enabled.
+
+Upstream-Status: Inappropriate [these files were dropped entirely in
+the upstream GTK4/libadwaita port (gduvolumegrid.c) or renamed with a
+GTK4-only gdkx.h path (gdupasswordstrengthwidget.c, gduestimator.c,
+see GNOME/gnome-disk-utility!179aab50); none carries a comparable fix
+for the GTK3 code line this recipe still builds]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/disks/gduestimator.c              | 1 -
+ src/disks/gdupasswordstrengthwidget.c | 1 -
+ src/disks/gduvolumegrid.c             | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/src/disks/gduestimator.c b/src/disks/gduestimator.c
+index 1111111..2222222 100644
+--- a/src/disks/gduestimator.c
++++ b/src/disks/gduestimator.c
+@@ -11,7 +11,6 @@
+
+ #include <math.h>
+ #include <gdk/gdkkeysyms.h>
+-#include <gdk/gdkx.h>
+ #include <stdlib.h>
+
+ #include "gduestimator.h"
+diff --git a/src/disks/gdupasswordstrengthwidget.c b/src/disks/gdupasswordstrengthwidget.c
+index 1111111..2222222 100644
+--- a/src/disks/gdupasswordstrengthwidget.c
++++ b/src/disks/gdupasswordstrengthwidget.c
+@@ -11,7 +11,6 @@
+
+ #include <math.h>
+ #include <gdk/gdkkeysyms.h>
+-#include <gdk/gdkx.h>
+ #include <stdlib.h>
+
+ #include <pwquality.h>
+diff --git a/src/disks/gduvolumegrid.c b/src/disks/gduvolumegrid.c
+index 1111111..2222222 100644
+--- a/src/disks/gduvolumegrid.c
++++ b/src/disks/gduvolumegrid.c
+@@ -11,7 +11,6 @@
+
+ #include <math.h>
+ #include <gdk/gdkkeysyms.h>
+-#include <gdk/gdkx.h>
+ #include <stdlib.h>
+
+ #include "gduvolumegrid.h"
diff --git a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
index 08854befa8..fa4298e8e9 100644
--- a/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
@@ -7,7 +7,6 @@ SECTION = "gnome"
 DEPENDS = " \
     desktop-file-utils-native \
     gtk+3 \
-    libcanberra \
     libdvdread \
     libnotify \
     libsecret \
@@ -28,6 +27,10 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 # As soon as elogind is of interest this needs rework: meson option is combo
 PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"

+SRC_URI += "file://0001-Drop-the-libcanberra-gtk3-dependency.patch \
+            file://0002-disks-drop-the-unused-gdk-gdkx.h-include.patch \
+"
+
 SRC_URI[archive.sha256sum] = "c24e9439a04d70bcfae349ca134c7005435fe2b6f452114df878bff0b89bbffe"

 EXTRA_OEMESON = "-Dman=false"

