Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7599CC54754
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 06:33:13 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.25506.1747549990459154438
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 May 2025 23:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id D0C2410E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 08:33:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.15]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGXa7-0kxVpb0; Sun, 18 May 2025 08:33:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gimp: update 3.0.2 -> 3.0.4
Date: Sun, 18 May 2025 08:33:00 +0200
Message-ID: <20250518063300.58623-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518063300.58623-1-f_l_k@t-online.de>
References: <20250518063300.58623-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1747549987-657F855F-82BA8E13/0/0 CLEAN NORMAL
X-TOI-MSGID: d8a9e80d-52a6-4a89-a673-3c1b774e28b3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 06:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117450

- fetch with gitsm. There is no tarball for this release (yet?)

Overview of Changes from GIMP 3.0.2 to GIMP 3.0.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Core:

  - Make maximum radius for generated brushes consistent across
    codebase.
  - Use NDE filter name for undo history.
  - Module loading improved to be better cross-platform (in particular
    on macOS both .so and .dylib modules are supported).
  - Code compliant with GCC 15 (C23).
  - Filter size updated when its drawable is rotated.
  - Font loading (at startup) optimized.
  - Set the proper program name for KDE/Wayland to map the process to
    the correct desktop file.
  - "windows-display-*" are hidden from the Shortcuts dialog (they are
    not meant to be remapped).
  - Editing non-destructive effects now triggers undo steps.
  - When migrating from GIMP 2.x to GIMP 3, shortcuts for actions
    "edit-paste-as-new-layer*" are now converted to "edit-paste-merged*"
    (and not "edit-paste*" anymore which was confusing and
    counter-productive).

Graphical User Interface:

  - Highlight selected device in GimpDeviceStatus.
  - Various theme leak fixes.
  - UX improvement: GimpViewableDialog (e.g. Fill/Stroke path and more)
    now has "OK" as default response.
  - Icon size settings now also applying to Move and Transform icon
    boxes.
  - Commit hash is now shown in About dialog in all non-release builds
    (i.e. even in stable series, when we are in-between releases).
  - Hide Force slider for Pencil Tool (rather than just making it
    insensitive).
  - Define merged titlebar icon colors.
  - Keep menubar color consistent when out of focus.
  - We don't show Fx icon for tool-based filters.
  - Updated splash without micro version in it.
  - Removed size restrictions on Display Filters.
  - Don't show hidden tools on toolbox tooltips.
  - Fix "Keep above" Window Manager hint.
  - Multi-Window mode on Windows: dock windows' title bars now adapt to
    the Windows system theme colors too.
  - Show palette name in Palette Color Selector.

Tools:

  - MyPaint Brush: have consistent options layout compared to other
    paint tools.
  - Scissors Select Tool: close the curve on Enter, similar to the Path
    tool.
  - Path Tool: connect path on click in design mode.

Plug-ins:

  - Restore GUI to Difference Clouds script. This had been lost since
    GIMP 2.8!
  - Fixes in various file format support, such as: DDS, SVG, TIFF, PSD,
    BMP, ICO=E2=80=A6
  - Screenshot dropdowns replaced by radio buttons, as part of a new UX
    decision that choice settings with 2 or 3 choices should be dropdown
    (faster 1-click access), unless there are a lot more settings making
    the dialog too crowded already.

PDB:

  - Make "gimp-plug-ins-query" public again (yet still not available in
    libgimp).

Build:

  - Windows Installer:
    * Make the installer aware of Install, Reinstall and Update modes.
    * Add Repair mode to Windows installer: in particular we can now fix
      installations when the previous install directory cannot be
      accessed anymore.
    * The feature to delete the config folder on Windows uninstall will
      now make a backup on the Desktop first (allowing people to delete
      it themselves, move it, or even restore it later if needed).
    * Uninstalling while GIMP is running is made impossible (among other
      issues, it was causing partial uninstallation).
    * Downgrading is only possible by uninstalling first.
    * Development warning is shown in dev build of stable series too.
    * Add fractional scaling support to Installer welcome image.
    * Restore points now have a timeout to prevent stuckness.
  - Our AppImage won't ship debug symbols anymore. Better debugging can
    be set with: export DEBUGINFOD_URLS=3D"https://debuginfod.debian.net"
  - Windows builds:
    * Ship babl/GEGL and libgimp headers, static libs and pkg-config
      files for plug-in developers.
    * Dedicated file icon for XCF files.
    * Generate native .pdb CodeView symbols on Windows (smaller debug
      data files, usable by MSIX and better debugging ability), except
      on x86 (32-bit).
  - Crossbuilds are dropped from CI.
  - Shell scripts used in the meson build are ported to Python (more
    portable and much faster on some platforms, in particular Windows).
  - Some build scripts were moved around for reorganization.
  - Depency requirement bumped:
    * babl 0.1.114
    * GEGL 0.4.62
  - New "Inputs" feature for simpler Gitlab pipelines running.
  - Some in-repository documentation was cleaned up.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ad2b2ca7ba36a01bef945b1c4b193a2fa9d0.patch | 62 -------------------
 .../gimp/{gimp_3.0.2.bb =3D> gimp_3.0.4.bb}     |  7 ++-
 2 files changed, 4 insertions(+), 65 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36a01=
bef945b1c4b193a2fa9d0.patch
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.0.2.bb =3D> gimp_3.0.4.bb} (=
94%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36a01bef945b=
1c4b193a2fa9d0.patch b/meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36=
a01bef945b1c4b193a2fa9d0.patch
deleted file mode 100644
index 3a2bf27616..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36a01bef945b1c4b193=
a2fa9d0.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 85bdad2b2ca7ba36a01bef945b1c4b193a2fa9d0 Mon Sep 17 00:00:00 2001
-From: Nils Philippsen <nils@tiptoe.de>
-Date: Wed, 29 Jan 2025 12:51:53 +0100
-Subject: [PATCH] Avoid type names and keywords
-
-This fixes various errors when compiling with current toolchains and/or
--std=3Dc23.
-
-Signed-off-by: Nils Philippsen <nils@tiptoe.de>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
85bdad2b2ca7ba36a01bef945b1c4b193a2fa9d0.patch]
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- libgimpconfig/gimpconfig-serialize.c |  6 +++---
- plug-ins/selection-to-path/types.h   | 13 ++++---------
- 2 files changed, 7 insertions(+), 12 deletions(-)
-
-diff --git a/libgimpconfig/gimpconfig-serialize.c b/libgimpconfig/gimpco=
nfig-serialize.c
-index 377b2371630..b3abca229d1 100644
---- a/libgimpconfig/gimpconfig-serialize.c
-+++ b/libgimpconfig/gimpconfig-serialize.c
-@@ -522,10 +522,10 @@ gimp_config_serialize_value (const GValue *value,
-=20
-   if (G_VALUE_HOLDS_BOOLEAN (value))
-     {
--      gboolean bool;
-+      gboolean boolean;
-=20
--      bool =3D g_value_get_boolean (value);
--      g_string_append (str, bool ? "yes" : "no");
-+      boolean =3D g_value_get_boolean (value);
-+      g_string_append (str, boolean ? "yes" : "no");
-       return TRUE;
-     }
-=20
-diff --git a/plug-ins/selection-to-path/types.h b/plug-ins/selection-to-=
path/types.h
-index 9b040fa3a19..1521937b15e 100644
---- a/plug-ins/selection-to-path/types.h
-+++ b/plug-ins/selection-to-path/types.h
-@@ -19,15 +19,10 @@
- #ifndef TYPES_H
- #define TYPES_H
-=20
--/* Booleans.  */
--typedef enum { false =3D 0, true =3D 1 } boolean;
--
--/* The X11 library defines `FALSE' and `TRUE', and so we only want to
--   define them if necessary.  */
--#ifndef FALSE
--#define FALSE false
--#define TRUE true
--#endif /* FALSE */
-+/* Cope with C23 */
-+typedef int boolean;
-+#define false FALSE
-+#define true TRUE
-=20
- /* The usual null-terminated string.  */
- typedef char *string;
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.4.bb
similarity index 94%
rename from meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
index 25a91ed1a5..32603af310 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
@@ -56,13 +56,14 @@ GIDOCGEN_MESON_OPTION =3D "gi-docgen"
 GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
 GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI =3D "https://download.gimp.org/gimp/v${@oe.utils.trim_version('$=
{PV}', 2)}/gimp-${PV}.tar.xz"
+SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gimp.git;protocol=3Dhttps;br=
anch=3Dmaster"
 SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch"
 SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"
 SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"
 SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
-SRC_URI +=3D "file://85bdad2b2ca7ba36a01bef945b1c4b193a2fa9d0.patch"
-SRC_URI[sha256sum] =3D "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0=
ad8cbcbf6ea571a2"
+SRCREV =3D "c1901c5be644ab8dcaf779b1f383bf5370bc90c6"
+
+S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
--=20
2.49.0


