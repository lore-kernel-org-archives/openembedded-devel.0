Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2D6F36C41
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:37:38 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14793.1776670655069859426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=sQL+SYy7;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 1EDDB9DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:37:12 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.160.240]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wEjBt-2t2DFB0; Mon, 20 Apr 2026 09:37:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: update 3.2.0 -> 3.2.4
Date: Mon, 20 Apr 2026 09:36:50 +0200
Message-ID: <20260420073658.100636-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1776670629-967FA4A8-2987C23C/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f4c4a4f-fc31-430b-b592-acaa4227a232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1776670632; i=f_l_k@t-online.de;
	bh=BZR8EYnrrIKBkcgjbvAVyYnbowuAXdEKvNQz3v3ob1s=;
	h=From:To:Subject:Date;
	b=sQL+SYy7IM+Oztc8+0cTHSr/bH0PqDJMNA84Tr/FUqB8UYjNnXBPXfXohK6+IfHDV
	 f6iDLEkIflNO4YkzwQraOdWjMKga4GpIhVuQBcV0ri7S+DAhhJdm+jqvxJe10MjAIC
	 hF69Eg9czTdzdijFiTa5Gbtk+6WWwNCA86/nvgZ4ke/eMcURxtS/epLsHBUuW7r8nk
	 cx2krhLp+831HmW1tbbWSeMW4zolH3UKiCXHZNzdhiLaXxwtVQtlhwUegaS4vyC+5j
	 VcXyZXJPEUOovcLDNNyivLcJ7gjk12qUUMVPevie/3/OIdopvG8/iDOGoYGR4Iup2X
	 AD4REA8NpCekg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 07:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126483

- add patches to fix compilation
- add runtime dependency for python3-pycairo

Overview of Changes from GIMP 3.2.2 to GIMP 3.2.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Core:

  - The "edit-fill-*" actions will now behave accordingly on specific
    cases. E.g. it will skip layers which can't be filled (content-lock
    layers and link layers) and it will fill the expected way
    non-rasterized text and vector layers.
  - Images opened through command lines are not considered stray images
    anymore on exit when run without a GUI (scripts, etc.).
  - We improved the support of the process temporary folder, so that we
    can avoid clashes when several users run GIMP on a same computer.
    Furthermore the temporary folder is now deleted at startup (unless
    it is not empty, which it should be).
  - XCF opened as layers will now always create new layers named as in
    the source XCF, even if the source XCF had only a single layer.
  - The "layers-resize" now only works on raster layers.
  - The "Layers to Image Size" and "Resize Layer to Selection" actions
    will only work on raster layers too.

Tool

  - Text tool:
    * When editing text, prioritize our global actions when a
      shortcut matches, before sending the hit keys to the IME (Input
      Method Engine). Otherwise some IME may consume our keys and block
      custom shortcuts (e.g. Alt+key events are often used to trigger
      special characters on macOS or Windows and may block core
      actions).
    * Prevent font size jumping to 0 when using shortcuts on selected
      text.
  - Selection tools: when moving a floating layer or selection,
    temporarily disable the marching ants outline. Among other reasons,
    it improves performance.
  - Select by Color tool: optimized processing when working in Intersect
    mode.
  - Crop tool: non-raster layers are not rasterized anymore.
  - Text tool: on-canvas GUI is now properly positioned when rotating
    the canvas.

Plug-Ins:

  - Improve import of: APNG, PAA, PNG, DDS, PSP, PNM, PSD, JIF, PVR
    texture, TIM, XWD, SFW, ORA.
  - Improved PDF export.
  - file-compressor: improved error messaging.
  - New Windows WIA scanner plug-in, replacing the now deprecated TWAIN
    scanner plug-in (which is not shipped in our Windows packages
    anymore as it depends on dropped 32-bit Windows platform).
  - Script-Fu: several deprecated functions now cleaned out from
    scripts.
  - Filmstrip: the created image will now have the dirty flag set.

API:

  - libgimp/PDB:
    * libgimp/PDB functions gimp_context_set_line_width_unit() and
      gimp_vector_layer_set_stroke_width_unit() now accept pixel as input=
 unit.
    * Improved error handling in gimp_temp_file().
    * New function: gimp_resources_loaded()
  - libgimp:
    * A function gimp_env_exit() was added, but same as gimp_env_init(),
      it is not declared in public headers and should never be used by
      plug-ins. It is considered private.
    * gimp_quit() function is deprecated.
  - PDB:
    * (gimp-quit) procedure (without libgimp wrapper) is deprecated.

Translations:

  - New Lao translation.

Build:

  - Many build warnings are being cleaned out.
  - New jobs are being set up with -Werror progressively as we weed out
    existing build warnings.
  - The issue bot will now run and create reports when specific jobs
    fail.
  - New rules to generate Markdown versions of our man pages for the
    website.

Overview of Changes from GIMP 3.2.0 to GIMP 3.2.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Core:

  - We removed support for a separate folder for loading 32-bit binaries
    on 64-bit Windows. This was being used for core plug-ins for the
    TWAIN plug-in only.
  - Various fixes related to the new non-destructive layer types, or to
    non-destructive layer effects.
  - More robust handling of Procreate and SwatchBooker palettes.
  - Fix scaling paths when importing SVG as paths.
  - We now support reading the documentation being installed in the user
    config directory in the `help/` subdirectory.
  - Histogram dialog: the unique color count feature now takes into
    account any selection.

Graphical User Interface:

  - Theme fixes.
  - Various text fixed for better localization.
  - Display the "Tab" shortcut for the "Hide Docks" action, even though
    it is not a real global shortcut (it only works on the canvas).
  - Metadata Rotation import dialog: you can now click the preview for
    Original and Rotated images in the Metadata Rotation Import Dialog,
    and have it open the image rotated as shown in the preview.

Plug-Ins:

  - Tile: carry over the source image's profile to the newly created
    image.
  - Improve support of: FITS, TIM, PAA, ICNS, PVR, SFW, JIF, PSP, PSD

Translations:

  - Serbian Cyrillic now has upstream support in InnoSetup (in their
    "Unofficial" list still, which means it is less verified). Our
    installer now has Serbian Cyrillic localization too.

Build:

  - NM environment variable is now used in priority for the `nm` tool
    used for the build. This check is stored from configure-time
    environment.
  - Windows x86 32-bit pipeline has now been decommissioned from our CI.
    This implies that 32-bit builds won't be available anymore in our
    Windows installer, just as was already the case on the Windows Store.
  - Meson build:
    * New boolean option -Dtwain-unmaintained: this puts our TWAIN
      plug-in behind a disabled-by-default flag, because this plug-in
      only made sense in 32-bit. The next step will be to replace it by
      a WIA plug-in.
    * Option -Dwin32-32bits-dll-folder removed.
  - GIMP can now be built fully without patches on macOS. The in-house
    macOS build is slowly moving to become our main CI for this OS and
    for making the release DMGs.
  - Snap: enable MIDI (Alsa) support.
  - AppImage: enable "Send by email".

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-check-for-python3-pygobject-gexiv2-.patch | 47 +++++++++++++++++++
 ...meson.build-disable-gimprc-man-build.patch | 33 +++++++++++++
 .../gimp/{gimp_3.2.0.bb =3D> gimp_3.2.4.bb}     |  7 ++-
 3 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0004-meson.build-do=
nt-check-for-python3-pygobject-gexiv2-.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0005-docs-meson.bui=
ld-disable-gimprc-man-build.patch
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.2.0.bb =3D> gimp_3.2.4.bb} (=
93%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0004-meson.build-dont-chec=
k-for-python3-pygobject-gexiv2-.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0004-meson.build-dont-check-for-python3-pygobject-gexiv2-.patch
new file mode 100644
index 0000000000..4eb6f9553d
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0004-meson.build-dont-check-for-p=
ython3-pygobject-gexiv2-.patch
@@ -0,0 +1,47 @@
+From d00c3c9fb8267f53cf730b8441a7d7f904af5215 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 20 Apr 2026 09:14:50 +0200
+Subject: [PATCH] meson.build: dont check for python3-pygobject gexiv2 su=
pport
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+We only provide support for gexiv2 in python3-pygobject for the target, =
but
+unfortunately this feature is being requested for the native version, wh=
ich
+would require gexiv2-native to be compilable =E2=80=94 something I consi=
der quite
+hard to achieve and maybe also not desirable at all.
+
+Remove the test for this feature, since we know that our target provides=
 it.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4f6f8ce9a4..4509cd2c39 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1224,7 +1224,7 @@ foreach py : py_candidates
+                                         '''except (ImportError):''',
+                                         '''    sys.exit(1)''']),
+                                         check: false).returncode() =3D=3D=
 0
+-    if pygobject_found.returncode() =3D=3D 0 and pygobject_found.stdout=
().strip().version_compare(pygobject_minver) and pygobject_gexiv2_found
++    if pygobject_found.returncode() =3D=3D 0 and pygobject_found.stdout=
().strip().version_compare(pygobject_minver)
+       break
+     endif
+   endif
+@@ -1235,7 +1235,7 @@ if not python.found() or not python.language_versi=
on().version_compare(python3_m
+ endif
+ message('Found Python @0@'.format(python.language_version()))
+=20
+-if pygobject_found.returncode() !=3D 0 or not pygobject_found.stdout().=
strip().version_compare(pygobject_minver) or not pygobject_gexiv2_found
++if pygobject_found.returncode() !=3D 0 or not pygobject_found.stdout().=
strip().version_compare(pygobject_minver)
+   error('No suitable PyGObject (with GExiv2 submodule) found. Minimum s=
upported version: @0@'.format(pygobject_minver))
+ endif
+ message('Found PyGObject: @0@'.format(pygobject_found.stdout().strip())=
)
+--=20
+2.53.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0005-docs-meson.build-disa=
ble-gimprc-man-build.patch b/meta-gnome/recipes-gimp/gimp/gimp/0005-docs-=
meson.build-disable-gimprc-man-build.patch
new file mode 100644
index 0000000000..91e7f92336
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0005-docs-meson.build-disable-gim=
prc-man-build.patch
@@ -0,0 +1,33 @@
+From 47948d14777438ca5e8619a1f9293db28af88305 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 20 Apr 2026 09:24:38 +0200
+Subject: [PATCH] docs/meson.build: disable gimprc man build
+
+This would require a native variant of gimp-console
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ docs/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/docs/meson.build b/docs/meson.build
+index 70b57b52ef..d36e47dbb5 100644
+--- a/docs/meson.build
++++ b/docs/meson.build
+@@ -16,9 +16,9 @@ gimprc_man =3D custom_target('gimprc-' + gimp_app_vers=
ion + '.5',
+                            command: [ gimp_exe, '--no-interface',
+                                       '--dump-gimprc-manpage' ],
+                            capture: true,
+-                           build_by_default: true,
++                           build_by_default: false,
+                            env: gimp_run_env,
+-                           install: true,
++                           install: false,
+                            install_dir: get_option('mandir') / 'man5')
+=20
+ gimptool_man =3D configure_file(input : 'gimptool.1.in',
+--=20
+2.53.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.2.4.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
index 1b092eb7e5..82c68346eb 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.4.bb
@@ -37,6 +37,7 @@ DEPENDS =3D " \
     poppler \
     poppler-data \
     python3-pygobject-native \
+    python3-pycairo-native \
     tiff \
     xz \
     zlib \
@@ -62,8 +63,10 @@ SRC_URI =3D "https://download.gimp.org/gimp/v3.2/${BP}=
.tar.xz \
            file://0001-meson.build-dont-check-for-lgi.patch \
            file://0002-meson.build-use-relative-path-for-ISO_CODES_LOCAT=
ION.patch \
            file://0003-meson.build-reproducibility-fix.patch \
+           file://0004-meson.build-dont-check-for-python3-pygobject-gexi=
v2-.patch \
+           file://0005-docs-meson.build-disable-gimprc-man-build.patch \
 "
-SRC_URI[sha256sum] =3D "2618391416e51be3c693df9ef90e3860ed72ab3d36363ea1=
f196e30b75b2e083"
+SRC_URI[sha256sum] =3D "7312bc53e9c6d2d0056ca7b93f1c6b98707946dd934f714c=
21b8746ecb601588"
=20
 PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
@@ -132,7 +135,7 @@ do_install:prepend() {
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
=20
-RDEPENDS:${PN} =3D "mypaint-brushes glib-networking python3-pygobject"
+RDEPENDS:${PN} =3D "mypaint-brushes glib-networking python3-pygobject py=
thon3-pycairo"
=20
 CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applie=
s for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] =3D "not-applicable-config: the vulnerability =
only affects MacOS"
--=20
2.53.0


