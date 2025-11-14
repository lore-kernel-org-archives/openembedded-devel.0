Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7753DCE8D4C
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 15:57:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1605.1763135831161820737
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 07:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TlC3s6KJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: skandigraun@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5958931c9c7so128223e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763135829; x=1763740629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iAJha3dNMNU1kyWvzmL4fslc1G2Saq4t2UVRk7A+9qQ=;
        b=TlC3s6KJm98CbK+FJTu+sLypZJqGJug9dqnJrzGPKvZMKENd9LOydHccxVe/on/74n
         yZn3HKwdsdLvwhkFucNkBVPmhKxNEmXMUmo4F63hBV/VjmJTocOxAQsoLKPZh5rf7twY
         x8KlKjD86VRPQ8QFJVfZRzO6a8sLJHoDKuYpmO0LcmkKg/vI970VcTSSdLlosHLEtQ2m
         Y/5LL4SwSZwinRhO27umQDFdkvQEhWkEiQO1C1jwwFujX6AAAw1Q2gUOHC0OZ38Pdqjf
         V5I8e8c3oLPtTcUmlTOu8dvMrUWeRc9xUjNiIfFe54pi9tjICMvE8966ZI835kn0D5m5
         g/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763135829; x=1763740629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAJha3dNMNU1kyWvzmL4fslc1G2Saq4t2UVRk7A+9qQ=;
        b=eoqa3BUFn1Df5FnUqPXLSMIcShebKhtlFFOlbI3zYqzdpv35jSU48Q9bp16Fv5CaR9
         +aPcXN/Ics+sDOWgv9OmhWPNi2SGwGpZId4xTwfSWkjKGflT//nzLAcvmdwwytcporhP
         NuXEaAIlFwRlgcFi4QTiKBMMf1EFMlCsirfQmNPtQw7aaaEQPQuZ6md6sKiIFsJ6pQkw
         hNAVJTIODGn336euV8SXKIAtS2yBJjukqorjtysW1pewmzpKS2TDBJSrluC37zRYH1UJ
         EkL/JwyF7iEr6APnA/YmwMIOqWd4GGlHDcVr7Rwt7QXLMds5y2gAQIH8H9w1upSKFLq0
         4SBQ==
X-Gm-Message-State: AOJu0YyzD36PhcyYc52p3qV180WSRuSSfAwAr+D0NlBygHKD5h4LnFzf
	q8FH85guqPRaK+/4ezEF+OzNMPM5VPpzEoB++Fg3u5Jz9hh+CqNk5XbT/ebl4dHb
X-Gm-Gg: ASbGncv0PhEfHEDnzZFIOf5cYcM/Iq6ccwbpQs38TZHLhPypcw1ERTPBKOeIRBeDIVP
	wKkaZmZJdMDHLCvLVrzIOxtzFJPpaHh0Fxgxe7kb6/CD+mgfraAQzvJn1QH7WTv5s+jSBNOlhBd
	3c3HZAraxT2Ep+M35oitg9Y/ng9P7/E71CwgOs85cBXEdQ+SSybH7/fcOQWBst/Lx9CINKBIxEf
	ibcSrVYmdHUQF5+y1Y+kgQe14af8pYmxQf96hSsuMnLpU+fn4NwRh8cW+djoKxw+1viRDmpOg9t
	eEzfjv/XQDcDd26SF3mvzoF3JKAIz93Iyj0uqIp4y+mwWobB55xM2hb70HwvdkuDJh4dSoEhYOv
	sbWd6WLcIqS+eCy33z2J2ep67/hEz4aE+RCCdv2j98b0mfe410mGKi+af0W849JcjjKRsF+VRF4
	/DHZM2Ief5
X-Google-Smtp-Source: AGHT+IH6PF5onupWOAXE3bnndK/xAqbehVQ3kjinZ13UdnA5z7HDV19fBeb9IHX177XwwanGB40/7Q==
X-Received: by 2002:a05:600c:4fc6:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-4778fe5ebdcmr35671405e9.2.1763131962246;
        Fri, 14 Nov 2025 06:52:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb54bbesm46044405e9.5.2025.11.14.06.52.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:52:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: upgrade 3.0.4 -> 3.0.6
Date: Fri, 14 Nov 2025 15:52:41 +0100
Message-ID: <20251114145241.542894-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 15:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121710

Switch back to fetch tarballs instead of the git repository.
The project has switched from appstream-glib to appstream as a dependency,
due to the prior isn't actively developed anymore[1].

This update also contains fixes for CVE-2025-10920, CVE-2025-10921, CVE-2025-10922,
CVE-2025-10923, CVE-2025-10924, CVE-2025-10925 and CVE-2025-10934.

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/c27096db9e7f328920b9ed9f23524f373facc480

Release notes:

Core:

  - Many false-positive build warnings have been cleaned out (and proper
    issues fixed).
  - Various crashes fixed.
  - When creating a layer mask from the layer's alpha, but the layer has
    no alpha, simply fill the mask with complete opacity instead of
    a completely transparent layer.
  - Various core infrastructure code reviewed, cleaned up, refactored
    and improved, in drawable, layer and filter handling code, tree view
    code, and more.
  - GIMP_ICONS_LIKE_A_BOSS environment variable is not working anymore
    (because "gtk-menu-images" and "gtk-button-images" have been
    deprecated in GTK3 and removed in GTK4) and was therefore removed.
  - Lock Content now shows as an undo step.
  - Add alpha channel for certain transforms.
  - Add alpha channel on filter merge, when necessary.
  - Filters can now be applied non-destructively on channels.
  - Improved Photoshop brush support.
  - After deleting a palette entry, the next entry is automatically
    selected. This allows easily deleting several entries in a row,
    among other usage.
  - Resize image to layers irrespective to selections.
  - Improved in-GUI release notes' demo script language:
    * We can now set a button value to click it:
      "toolbox:text,
      tool-options:outline=1,
      tool-options:outline-direction"
    * Color selector's module names can be used as identifiers:
      "color-editor,color-editor:CMYK=1,color-editor:total-ink-coverage"
  - Fixed Alpha to Selection on single layers with no transparency.
  - Various code is slowly ported to newer code, preparing for GTK4 port
    (in an unplanned future step):
    * Using g_set_str() (optionally redefining it in our core code to
      avoid bumping the GLib minimum requirement).
    * Start using GListModel in various pieces of code, in particular
      getting rid of more and more usage of GtkTreeView when possible
      (as it will be deprecated with GTK4).
    * New GimpRow class for all future row widgets.
    * Use more of G_DECLARE_DERIVABLE_TYPE and G_DECLARE_FINAL_TYPE
      where relevant.
    * New GimpContainerListView using a GtkListBox.
    * New GimpRowSeparator, GimpRowSettings, GimpRowFilter and
      GimpRowDrawableFilter widgets.
  - (Experimental) GEX Format was updated.
  - Palette import:
    * Set alpha value for image palette imports.
    * Fix Lab & CMYK ACB palette import.
    * Add palette format filters to import dialog, making it more
      apparent what palette formats are supported, and giving the
      ability to hide irrelevant files.
  - Improved filter actions' sensitivity to make sure they are set
    insensitive when relevant. In particular filters which cannot be run
    non-destructively (e.g. filters with aux inputs, non-interactive
    filters and GEGL Graph) must be insensitive when trying to run them
    on group layers.
  - Fix bad axis centering on zoom out.
  - Export better SVG when exporting paths.

Tools:

  - Text tool: make sure the default color is only changed when the user
    confirms the color change.
  - Foreground Selection tool: do not create a selection when no strokes
    has been made. In particular this removes the unnecessary delay
    which happened when switching to another tool without actually
    stroking anything.
  - All Transform tools: transform boundaries for preview is now
    multi-layers aware.
  - (Experimental) Seamless Clone tool: made to work again, though it is
    still too slow to get out of Playground.

Graphical User Interface:

  - Various improvements to window management:
    * Keep-Above windows are set with the Utility hint.
    * Utility windows are not made transient to a parent.
    * Transient factory dialogs follow the active display, ensuring that
      new image windows would not hide your toolbox and dock windows.
  - Various CSS improvements for styling of the interface. Some theme
    leaks were also fixed.
  - New toggle button in Brushes and Fonts dockable, allowing brush and
    font previews to optionally follow the color theme. For instance,
    when using a dark theme, the brush and font previews could be drawn
    on the theme background, using the theme foreground colors. By
    default, these data previews are still drawn as black on white.
  - Palette grid is now drawn with the theme's background color.
  - Consistent naming patterns on human-facing options (first word only
    capitalized).
  - About dialog:
    * We will now display the date and time of the last
      check in a "Up to date as of <date> at <time>" string, differing
      from the "Last checked on <date> at <time>" string. The former
      will be used to indicate that GIMP is indeed up-to-date whereas
      the latter when a new version was released and that you should
      update.
    * We now respect the system time/date format on macOS and Windows.
  - The search popup won't pop up without an image.
  - Better zoom step algorithm for data previews in container popup
    (e.g. the brush popup in paint Tool Options).
  - Disable animation in the Input Controller, Preferences and Welcome
    dialogs for stack transition when animation are disabled in system
    settings.
  - Fixed crosshair hotspot on Windows (crosshair cursor for brushes was
    offset with a non-100% display scale factor).
  - Debug/CRITICAL dialog:
    * Make sure it is non-modal.
    * Follow the theme mode under Windows.
  - While loading images, all widgets in the file dialog are made
    insensitive, except for the Cancel button and the progress bar.
  - Both grid and list views can now zoom via scroll and zoom gestures
    (it used to only work in list views).
  - Pop an error message up on startup when GIO modules to read HTTPS
    links are not found and that we therefore fail to load the remote
    gimp_versions.json file. With the AppImage package in particular, we
    depend on an environment daemon which cannot be shipped in the
    package. So the next best thing is to warn people and tell them what
    they should install to get version checks.
  - Welcome dialog:
    * The "Community Tutorials" link is now shown after the
      "Documentation" link.
    * The "Learn more" link in Release Notes tab leads to the actual
      release news for this version.

Plug-ins:

  - PDF export: do not draw disabled layer masks.
  - Jigsaw: the plug-in can now draw on transparent layers.
  - Various file format fixes and improvements: JPEG 2000 import, TIFF
    import, DDS import, SVG import, PSP import, FITS export, ICNS
    import, Dicom import, WBMP import, Farbfeld import, XWD import, ILBM
    import.
  - Sphere Designer: use spin scale instead of spin entries (the latter
    is unusable with little horizontal space).
  - Animation Play: frames are shown again in the playback progress bar.
  - Vala Goat Exercise: ignoring C warning in this Vala plug-in as it is
    generated code and we cannot control it.
  - file-gih: brush pipe selection modes now have nice, translatable
    names.
  - Metadata viewer: port from GtkTreeView to GtkListBox.
  - File Raw Data: reduce Raw Data load dialogue height by moving to a
    2-column layout.
  - SVG import: it is now possible to break aspect ratio with specific
    width/height arguments, when calling the PDB procedure
    non-interactively (from other plug-ins).
  - Print: when run through a portal print dialog, the "Image Settings"
    will be exposed as a secondary dialog, outputted after the portal
    dialog, instead of a tab on the main print dialog (because it is not
    possible to tweak the print dialog when it is created by a portal).
    This will bring back usable workflow of printing with GIMP when run
    in a sandbox (e.g. Flatpak or Snap).
  - Recompose: fixed for YCbCr decomposed images.
  - Fixed vulnerabilities: ZDI-CAN-27684, ZDI-CAN-27863, ZDI-CAN-27878,
    ZDI-CAN-27836, ZDI-CAN-27823, ZDI-CAN-27793.
  - C Source and HTML export can now be run non-interactively too (e.g.
    from other plug-ins).
  - Map Object: fix missing spin boxes.
  - Small Tiles: fix display lag.

API:

  - libgimpui:
    * new function: gimp_prop_toggle_new()
    * updated widget default for GimpChoice in GimpProcedureDialog: when
      the number of choices is below 3, a radio frame is used, and a
      combo box otherwise (it used to always be a combo box).
    * GimpExportProcedureDialog: comment text area will be made
      (in)sensitive depending on the checked state of "Save Comment"
      option.
    * Use arrows for GimpSpinScale cursors.
    * GimpColorScales: no decimal for u8 RGB color selector. This change
      will help further distinguish between the 0...100 and 0..255 views
      in the Color Selectors.
    * Internal color drags now use a "application/x-geglcolor" target
      since "application/x-color" is standard and should not be used for
      our more powerful color formats.
  - libgimp:
    * new enum type: GimpTRCType
    * gimp_file_save() sets the XCF or exported files accordingly.
    * Metadata:
      + Favor existing image comment instead of always loading comment
        from metadata.
      + Fix handling of "charset=" in comments.
      + Better heuristic to choose the comment to export, especially
        when it has been edited in the export dialog comment field.
      + XMP modification date format fix and Exif.Image.DateTime
        metadata has been modernized, also adding the timezone.
  - PDB/libgimp:
    * Allow nullable sample points and guide types for some
      functions.
    * GeglParamFilePath can now be passed across the wire.
  - macOS: improve dock icon flashing issue.

Build:

  - CI scripts synced to latest `master` state.
  - Windows file format association list is now generated at build time,
    avoiding discrepancies.
  - Build scripts are made POSIX-compliant for better portability across
    platforms.
  - New nightly Snap package.
  - New nightly Aarch64 flatpak.
  - Core code ported from appstream-glib to libappstream.
  - Windows installer now uses the latest InnoSetup again.
  - New option -Dwin-debugging=dwarf to generate DWARF symbols on
    Windows (defaults to CodeView symbols).
  - Compilation should work again fine with older librsvg (before the
    Rust port).
  - release-stats.sh script updated to generate text directly pastable
    into our release news.
  - CI:
    * Linux builds ported from unmaintained Kaniko to Buildah.
    * Colored output and .pdb support for builds of dependency using
      CMake.
    * Ability to apply remote patches on dependency builds.
    * New job "branches-check" to warn about dead branches.
    * Our Debian jobs are now built with GCC again (the CLang builds are
      switched to weekly scheduled jobs).
  - Clean out deprecation warnings on GLib and GTK/GDK based on our
    minimum requirement of these dependencies thanks to
    GLIB_VERSION_MIN_REQUIRED() and GLIB_VERSION_MAX_ALLOWED() macros
    (and equivalent GDK macros).
  - We now build Exiv2 ourselves on Windows as a temporary workaround to
    issue #12626.
  - Improved packages binary caching with ORAS for Flatpak.
  - AppImage: we now depend on Debian Trixie.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch    | 4 ++--
 .../recipes-gimp/gimp/{gimp_3.0.4.bb => gimp_3.0.6.bb}     | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.0.4.bb => gimp_3.0.6.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
index 721225c8b3..380e425f25 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
@@ -16,8 +16,8 @@ diff --git a/meson.build b/meson.build
 index 4e48f8c64c..d5dce47015 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -765,7 +765,7 @@ zlib = dependency('zlib')
- MIMEtypes += 'image/x-psp'
+@@ -777,7 +777,7 @@ zlib = dependency('zlib')
+ zlib = dependency('zlib')
  
  # Compiler-provided headers can't be found in crossroads environment
 -if not meson.is_cross_build()
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
index e2ad29eb98..9f38cdcd03 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.4.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 DEPENDS = " \
-    appstream-glib \
+    appstream \
     atk \
     babl \
     bzip2 \
@@ -56,13 +56,12 @@ GIDOCGEN_MESON_OPTION = "gi-docgen"
 GIDOCGEN_MESON_ENABLE_FLAG = "enabled"
 GIDOCGEN_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI = "gitsm://gitlab.gnome.org/GNOME/gimp.git;protocol=https;branch=master"
+SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz"
 SRC_URI += "file://0001-gimp-cross-compile-fix-for-bz2.patch"
 SRC_URI += "file://0002-meson.build-reproducibility-fix.patch"
 SRC_URI += "file://0001-meson.build-dont-check-for-lgi.patch"
 SRC_URI += "file://0001-meson.build-require-iso-codes-native.patch"
-SRCREV = "c1901c5be644ab8dcaf779b1f383bf5370bc90c6"
-
+SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
 
 PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
 PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"

