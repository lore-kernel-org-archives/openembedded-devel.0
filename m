Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DDEE83071
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 09:55:24 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13156.1770112516245022845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 01:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jda1x4tB;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-662f65c7d8cso2960348eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 01:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770112515; cv=none;
        d=google.com; s=arc-20240605;
        b=N5DA6CjlHSo0n/lOPEXaAhNgKj5qb0+enFSrmT6eHYJulFU1WzmingC7GekLz4mq4q
         M32AqhhYG/Zr576o2VRDKLY+okU2aJ9cIhd0woMZaQxGfeU+wJ7Fu7XXkGiNRT4iASeK
         Bq6JU9pZIQmxRnOEDNvpkf8ODT1GOIt4U3OtBFqEKumaOAc/MO4XJeNzmbuWbtTezDiP
         vEuutgwRPq6eMhaPjcXgSsvKtQ9L6ZeafdquGYw4bTh+seTcC3tgaaZ7NVtMv18jGT5m
         G8BzLX9kazifK01+wBwr/BCNH+yr8wZEGke6TpK5wg2tkN+Nj5H2nY9EVZE3rUqi4Izg
         BPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vA1/lLkKoKbuu9Vyh2cxZU9+ExBje7oqmVG0D4FY/M=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=EKlAjrKr6SongYmaP4Vn6M9TyE4WHgenNkzly3zD+zuhPerPMMcLG8Lu4kUdEho14h
         8oE6gS3BPUwqHXPWkyvDNj15O03QUFm+YzvQpXnPZa7dyoU1FiKJtJtYAYDNjNDvj4mo
         3XfiQp64ZCwL5XVwBKI7tTRJXeOV+sYQYUdEly1v2ea92iTUFi9dmafwLDcVAj1dIcWW
         zUzghvqTKPuORQ166BdqTCkh+OJjPndIw+5FhT/kma3lMoCWnkSEv9WDGrlDTYJ3q9Nc
         yMRoMWBhGQBXsRKdUbK9SnAC6yoRDXCQkw7F7LO7AjgtXyIyJ20zD+j2aGzAoM60hODA
         8Zzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770112515; x=1770717315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vA1/lLkKoKbuu9Vyh2cxZU9+ExBje7oqmVG0D4FY/M=;
        b=Jda1x4tBilz1g2R0AW6Fp+j6Ba98F34/1v2LU5zrkns0zSPO0owPb1BPv9o0wQ/Sps
         +JP9G4g5jaS0mzFM7EInFMEgXEBVoaqXlq2ncejdOhx6O5ayisXmF7eElVoPPJZw2TA+
         mWEYBnXRbQ2IMRD2Mz4s4HE+mAWc+kI6RyK+fWCZSZ1ZKNpngi1XgutkooljGDK9N9bO
         gFpFPBAXnKfwchcuD/4vzQm/tUvcuTopwoJYHtYN7Wk3B4kQqOeg2p64jspB2I/FpxdU
         90ZoJEbkpDA/YA8iaDhbbGwDJhaZtSCBdwSZbbuVSou/6RAWv6pkoNhaOjQKZFQBA0cv
         O4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112515; x=1770717315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1vA1/lLkKoKbuu9Vyh2cxZU9+ExBje7oqmVG0D4FY/M=;
        b=xIHbZP1cDGdwECL8AJmFwLwWG6GT01OKNRHdFEGcci9MEN1/HF1i5z+8GjrwWRJI+M
         XJYzwpLtGckWsYQ2JtzaE37cIFmo3TuntOrV+ZG/5R9HfVDFGNs9jD2jEP45owKZOoM+
         9hmqR9A+jjZMjHfhdA5zjH0yscZ227XISSrinuD4cpiWoyZX84zPo/5unfj2Dzx69+L5
         Fh8p8czz6tbe5HCAN9mElJZP/kLLbicAta0Im2XXWV1gFFu0agJ4JgQ4Pqu4N7B+k2mC
         ILG0QXi4eBJFr7DUBINL9ltwcMoIRos09Ss6d2+dpFa4D6BHkWoY4n0XCGRhyrgoJF6j
         imSQ==
X-Gm-Message-State: AOJu0YxoBMAbdLyCMNTa0BxS+cOVmhaSYYPMxwv6rByysSe5Rtk2aB3Z
	Hoxsfgl2xvOE/dSxrI1a3j9PDWy0YRACw9Zx8yiXrV7Z3zviet5EjQvCfFjIrlGx1W2pxMzg14n
	4Qt4KatAzNiN++Po2vQM842v1YINf5kA=
X-Gm-Gg: AZuq6aIny0eTn7LqkLerfHLls7k9SHMFcBlTKkZ0NnPK7zRnFcYxCVBqbjIpJ990xMl
	bBlwkCNP0coJW9CTkffN9GH9Yfz15AyPjncnAvrGgnAyWvpyk1opi1eEWARy+O6lWLX8EdhLmaT
	38qlpWJSMDaQQrg9wQ4VO9OACirj1g6FEzMoSlQ4e190oQhxiM+bkmuY2jE9ugskgmuCR9cEyZE
	PpNU1vyGXUXkTOVPttTfm7zkLk9QjeuS5sAPwXTkIMRfhFI2wtciiI/0br5GYi5Iuls9jT9
X-Received: by 2002:a05:6820:4612:b0:662:bf84:9daa with SMTP id
 006d021491bc7-6630f3611bamr4838888eaf.45.1770112515177; Tue, 03 Feb 2026
 01:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20260202211401.1287664-1-skandigraun@gmail.com> <20260202211401.1287664-5-skandigraun@gmail.com>
In-Reply-To: <20260202211401.1287664-5-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 3 Feb 2026 22:55:03 +1300
X-Gm-Features: AZwV_QjakCHVFbUkn4_MP36D-Qfd_zTsYE8Ro11A0i_ChP3wuiDTM1GAp9ZGvD8
Message-ID: <CADySD0EcZWxVKog9yjZRSx0jyU3-5+UyBPOp-nwTv6S+hvXDtw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH 05/15] gimp: update 3.0.6 -> 3.0.8
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 09:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124097

Hi Gyorgy,

Getting following error when building for qemux86 with musl and clang

/gimpbacktrace-linux.c.o: in function `gimp_backtrace_get_address_info':
| /usr/src/debug/gimp/3.0.8/../sources/gimp-3.0.8/app/core/gimpbacktrace-li=
nux.c:708:(.text+0xc14):
undefined reference to `_ULx86_init_local'
| /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-=
musl/gimp/3.0.8/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-pok=
y-linux-musl-ld:
/usr/src/debug/gimp/3.0.8/../sources/gimp-3.0.8/app/core/gimpbacktrace-linu=
x.c:709:(.text+0xc27):
undefined reference to `_ULx86_set_reg'
| /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-=
musl/gimp/3.0.8/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-pok=
y-linux-musl-ld:
/usr/src/debug/gimp/3.0.8/../sources/gimp-3.0.8/app/core/gimpbacktrace-linu=
x.c:710:(.text+0xc61):
undefined reference to `_ULx86_get_proc_name'
| i686-poky-linux-musl-clang++: error: linker command failed with exit
code 1 (use -v to see invocation)
| ninja: build stopped: subcommand failed.

Can you please have a look into it?

cheers
Ankur

On Tue, Feb 3, 2026 at 10:14=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Markus Volk <f_l_k@t-online.de>
>
> - remove cve fixes which are included in this release
> - remove the fix for bzip2. meson.build was improved so this is not
>   required anymore
> - inherit bash-completion
>
> This releases contains a lot of bugfixes. The below list is not
> exhaustive.
> Core:
>   - Font handling improvements:
>     * Font loading on start massively sped up.
>     * As an exception, Skia font family (apparently quite common on macOS=
)
>       is special-cased because it behaves weirdly and was not working wit=
h
>       current font handling.
>     * Various other fixes related to font handling.
>     * We now wait for fonts to be fully loaded before loading any file.
>   - Command Line Interface:
>     * Option -i / --no-interface is not shown anymore on `gimp-console`
>       binary (it can still be used =E2=80=94 it does nothing there anyway=
 =E2=80=94, which
>       allows to use the same sets of option with the GUI binary, and also
>       so that existing shell scripts don't break).
>     * Option --show-debug-menu is not hidden anymore for discoverability.
>     * The `gimp-3.0` executable can now run with --no-interface even when
>       no display is available (ex: virtual terminal with no window
>       manager/compositor, containers, etc.). This used to only work with
>       `gimp-console-3.0` executable.
>   - Windows:
>     * output CLI messages to the parent console like Linux and macOS.
>     * Ctrl+C signals are now correctly handled in the attached console.
>     * The attached console supports color too.
>     * Interpreters are run conditionally if running in console.
>   - macOS: default to "quartz" Input Method for emoji keyboard support.
>   - Wayland: wait before we get our first surface before listing input
>     devices to work around a Wayland limitation and GTK bug.
>   - Default "Search" feature in GTK3 is now disabled in the component
>     editor in the Channels dockable.
>   - Several fixes related to Quick Mask handling.
>   - Fixed some cases where config migration from GIMP 2 to GIMP 3 was
>     problematic.
>   - Several buggy undo cases were fixed.
>   - Several fixes related to pass-through group layers.
>   - Export will now be properly triggered even if no drawables are
>     selected (this is not a requirement anymore with GIMP 3 API).
>   - Path import and export respectively from and to SVG improved.
>   - Serialize colors in legacy GimpRGB format into a XCF when the XCF
>     version is older than GIMP 3 for backward compatibility.
> Tools:
>   - Symmetry: fix initial stroke symmetry when using pixmap brushes.
>   - Move tool: fixed weird position jumps in some cases.
> Graphical User Interface:
>   - Center buttons in overlay dialogs.
>   - Headerbar's (when titlebar and menubar are merged) button colors
>     now match our theme.
>   - Dialogs' header icon and view will now scale based on custom icon
>     size.
>   - Resize dialog: Canvas Size fill combo set to insensitive if layers
>     won't be resized.
>   - Navigation and Selection editor will now properly match the theme
>     (in particular, in dark mode, they won't show large bright area).
>
>   - Do not show outlines when hovering the absent "Fx" icon anymore,
>     which was confusing people into making it look like you could click
>     and interact with this empty area.
> Plug-ins:
>   - Fixes on: OpenRaster export, TIFF import, Map Object, PDF export,
>     Gradient Flare, ANI export, Script-Fu, DDS export, Fractal Explorer,
>     PSP import, ICO import, XWD import, PSD import, WebP export, ICNS
>     import, Gimpressionist, JPEG 2000 import, Busy Dialog.
>   - Scale entries have been replaced by spin scale widgets in a bunch of
>     plug-ins.
>   - Fixed vulnerabilities: ZDI-CAN-28376, ZDI-CAN-28311, ZDI-CAN-28273,
>     ZDI-CAN-28158, ZDI-CAN-28232, ZDI-CAN-28265, ZDI-CAN-28530,
>     ZDI-CAN-28248, PSP issue 15732.
>   - Script-Fu improved to not initialize UI code unnecessarily (and
>     therefore make it unusable on systems without a display).
> API:
>   - libgimp:
>     * Fixes where made in libgimp metadata object.
>     * Make GExiv2Metadata as parent of GimpMetadata visible to
>       Gobject-Introspection tools (bindings were missing this
>       information).
>     * Fixes made on: gimp_drawable_get_thumbnail(),
>       gimp_drawable_get_sub_thumbnail(), gimp_drawable_filter_new(),
>       gimp_proc_view_new(), gimp_procedure_set_sensitivity_mask(),
>       gimp_procedure_dialog_get_spin_scale().
>     * Remove thumbnail metadata before writing it on export, to make
>       sure we don't cary on metadata written by other software in
>       thumbnails.
>   - libgimpconfig:
>     * Improve error messaging on config deserialization.
>     * Fix gimp_config_serialize_value() when serializing file objects.
>     * New functions: gimp_config_get_xcf_version() and
>       gimp_config_set_xcf_version().
>   - libgimpcolor:
>     * gimp_color_is_perceptually_identical() docs clarified.
>   - libgimpbase:
>     * The host config directory is now shown in MSIX.
>     * The host config directory is now shown in flatpak.
>   - libgimpwidgets:
>     * Fixes made on: GimpLabelEntry, gimp_widget_free_native_handle().
>   - libgimpcolor:
>     * New function: gimp_cairo_surface_get_buffer()
>     * Deprecated function: gimp_cairo_surface_create_buffer() in favor
>       of gimp_cairo_surface_get_buffer().
>       The function implementation was also changed so that it does not
>       necessarily return a linear-memory backed buffer anymore (it
>       might, but developers should not have any expectation about this).
> Build:
>   - Third-party binary plug-in support in the Snap backported from the
>     original third-party snap.
>   - Snap package for release is now created and submitted on a release
>     pipeline.
>   - Release URLs added to AppStream metadata.
>   - We do not build GEGL with Matting Levin for Windows builds anymore
>     because of crashes.
>   - Flatpak nightly builds will now show a pseudo-release visible with
>     `flatpak list`, showing proper version information.
>   - Windows installer now has a dark mode.
>   - Update changelog on MS Store (MSIX) releases.
>   - AppImage now ships with full MIDI support.
>   - Make it clearer that GExiv2 0.15.0 and over are incompatible
>     (because of API breakage).
>   - Improve build to ensure that the language list (shown in
>     Preferences) is localized during compilation. This also means that a
>     build machine should be set up for localization at build time when
>
>     optional language selection is enabled.
>   - We now require the generic C++14 standard, and not the GNU variant
>     anymore.
>   - MSVC support added.
>   - Various tweaks which used to be required to make packages work as
>     relocatable builds were dropped since babl and GEGL now have a
>     relocatable option working also on Linux.
>   - The `man` page of GIMP binaries was updated.
>   - The `gimp-console` binary is now shipped in the Flatpak.
>   - macOS pipeline added in our Gitlab CI.
>   - Make sure that harfbuzz is built with libgraphite2 shaper on macOS.
>   - Generate file associations for macOS automatically.
>   - A Bash completion file was added for `gimp` and `gimp-console`
>     binaries.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit f8fcc9ccf529455c992e79fc13e77dfc1a8dd9d9)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 -----
>  .../gimp/gimp/CVE-2025-14422.patch            |  66 -----------
>  .../gimp/gimp/CVE-2025-14423.patch            | 106 ------------------
>  .../gimp/gimp/CVE-2025-14424.patch            |  34 ------
>  .../gimp/gimp/CVE-2025-14425.patch            |  79 -------------
>  .../gimp/{gimp_3.0.6.bb =3D> gimp_3.0.8.bb}     |   9 +-
>  6 files changed, 2 insertions(+), 322 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-com=
pile-fix-for-bz2.patch
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patc=
h
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patc=
h
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patc=
h
>  delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patc=
h
>  rename meta-gnome/recipes-gimp/gimp/{gimp_3.0.6.bb =3D> gimp_3.0.8.bb} (=
92%)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fi=
x-for-bz2.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile=
-fix-for-bz2.patch
> deleted file mode 100644
> index 380e425f25..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-b=
z2.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Wed, 25 Dec 2024 07:27:04 +0100
> -Subject: [PATCH] gimp: cross-compile fix for bz2
> -
> -autotools bzip2 build does not create pkgconfig files so looking for the=
 dependency fails.
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> -
> -Upstream-Status: Inappropriate [can probably be removed once bzip2 is bu=
ilt with meson or cmake]
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 4e48f8c64c..d5dce47015 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -777,7 +777,7 @@ zlib =3D dependency('zlib')
> - zlib =3D dependency('zlib')
> -
> - # Compiler-provided headers can't be found in crossroads environment
> --if not meson.is_cross_build()
> -+if true
> -   bz2 =3D cc.find_library('bz2')
> - else
> -   bz2 =3D dependency('bzip2')
> ---
> -2.47.1
> -
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/met=
a-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> deleted file mode 100644
> index 420e013916..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From 0a941cab81396d65a8ab547847f8c542039e214f Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sun, 23 Nov 2025 16:43:51 +0000
> -Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
> -
> -From: Alx Sa <cmyk.student@gmail.com>
> -
> -Resolves #15286
> -Adds a check to the memory allocation
> -in pnm_load_raw () with g_size_checked_mul ()
> -to see if the size would go out of bounds.
> -If so, we don't try to allocate and load the
> -image.
> -
> -CVE: CVE-2025-14422
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
4ff2d773d58064e6130495de498e440f4a6d5edb]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - plug-ins/common/file-pnm.c | 13 +++++++++++--
> - 1 file changed, 11 insertions(+), 2 deletions(-)
> -
> -diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
> -index 32a33a4..9d349e9 100644
> ---- a/plug-ins/common/file-pnm.c
> -+++ b/plug-ins/common/file-pnm.c
> -@@ -674,7 +674,7 @@ load_image (GFile   *file,
> -             GError **error)
> - {
> -   GInputStream    *input;
> --  GeglBuffer      *buffer;
> -+  GeglBuffer      *buffer    =3D NULL;
> -   GimpImage * volatile image =3D NULL;
> -   GimpLayer       *layer;
> -   char             buf[BUFLEN + 4];  /* buffer for random things like s=
canning */
> -@@ -708,6 +708,9 @@ load_image (GFile   *file,
> -       g_object_unref (input);
> -       g_free (pnminfo);
> -
> -+      if (buffer)
> -+        g_object_unref (buffer);
> -+
> -       if (image)
> -         gimp_image_delete (image);
> -
> -@@ -1060,6 +1063,7 @@ pnm_load_raw (PNMScanner *scan,
> -   const Babl   *format =3D NULL;
> -   gint          bpc;
> -   guchar       *data, *d;
> -+  gsize         data_size;
> -   gushort      *s;
> -   gint          x, y, i;
> -   gint          start, end, scanlines;
> -@@ -1070,7 +1074,12 @@ pnm_load_raw (PNMScanner *scan,
> -     bpc =3D 1;
> -
> -   /* No overflow as long as gimp_tile_height() < 1365 =3D 2^(31 - 18) /=
 6 */
> --  data =3D g_new (guchar, gimp_tile_height () * info->xres * info->np *=
 bpc);
> -+  if (! g_size_checked_mul (&data_size, gimp_tile_height (), info->xres=
) ||
> -+      ! g_size_checked_mul (&data_size, data_size, info->np)           =
  ||
> -+      ! g_size_checked_mul (&data_size, data_size, bpc))
> -+    CHECK_FOR_ERROR (FALSE, info->jmpbuf, _("Unsupported maximum value.=
"));
> -+
> -+  data =3D g_new (guchar, data_size);
> -
> -   input =3D pnmscanner_input (scan);
> -
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch b/met=
a-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
> deleted file mode 100644
> index 50a0adfe89..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From a83e8c4ad8ffbce40aa9f9a0f49880e802ef7da1 Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Sun, 23 Nov 2025 04:22:49 +0000
> -Subject: [PATCH] plug-ins: Fix ZDI-CAN-28311
> -
> -From: Alx Sa <cmyk.student@gmail.com>
> -
> -Resolves #15292
> -The IFF specification states that EHB format images
> -have exactly 32 colors in their palette. However, it
> -is possible for images in the wild to place an incorrect
> -palette size. This patch checks for this, and either limits
> -the palette size or breaks accordingly.
> -
> -CVE: CVE-2025-14423
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
481cdbbb97746be1145ec3a633c567a68633c521]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - plug-ins/common/file-iff.c | 32 ++++++++++++++++++++++----------
> - 1 file changed, 22 insertions(+), 10 deletions(-)
> -
> -diff --git a/plug-ins/common/file-iff.c b/plug-ins/common/file-iff.c
> -index d144a96..f087947 100644
> ---- a/plug-ins/common/file-iff.c
> -+++ b/plug-ins/common/file-iff.c
> -@@ -337,7 +337,7 @@ load_image (GFile        *file,
> -       width      =3D bitMapHeader->w;
> -       height     =3D bitMapHeader->h;
> -       nPlanes    =3D bitMapHeader->nPlanes;
> --      row_length =3D (width + 15) / 16;
> -+      row_length =3D ((width + 15) / 16) * 2;
> -       pixel_size =3D nPlanes / 8;
> -       aspect_x   =3D bitMapHeader->xAspect;
> -       aspect_y   =3D bitMapHeader->yAspect;
> -@@ -375,6 +375,18 @@ load_image (GFile        *file,
> -             {
> -               /* EHB mode adds 32 more colors. Each are half the RGB va=
lues
> -                * of the first 32 colors */
> -+              if (palette_size < 32)
> -+                {
> -+                  g_set_error (error, G_FILE_ERROR,
> -+                               g_file_error_from_errno (errno),
> -+                               _("Invalid ILBM colormap size"));
> -+                  return NULL;
> -+                }
> -+              else if (palette_size > 32)
> -+                {
> -+                  palette_size =3D 32;
> -+                }
> -+
> -               for (gint j =3D 0; j < palette_size * 2; j++)
> -                 {
> -                   gint offset_index =3D j + 32;
> -@@ -386,7 +398,7 @@ load_image (GFile        *file,
> -                   gimp_cmap[offset_index * 3 + 2] =3D
> -                     colorMap->colorRegister[j].blue / 2;
> -                 }
> --              /* EHB mode always has 64 colors */
> -+              /* EHB mode always has 64 colors in total */
> -               palette_size =3D 64;
> -             }
> -         }
> -@@ -447,7 +459,7 @@ load_image (GFile        *file,
> -         {
> -           guchar *pixel_row;
> -
> --          pixel_row =3D g_malloc (width * pixel_size * sizeof (guchar))=
;
> -+          pixel_row =3D g_malloc0 (width * pixel_size);
> -
> -           /* PBM uses one byte per pixel index */
> -           if (ILBM_imageIsPBM (true_image))
> -@@ -459,7 +471,7 @@ load_image (GFile        *file,
> -           else
> -             deleave_rgb_row (bitplanes, pixel_row, width, nPlanes, pixe=
l_size);
> -
> --          bitplanes +=3D (row_length * 2 * nPlanes);
> -+          bitplanes +=3D (row_length * nPlanes);
> -
> -           gegl_buffer_set (buffer, GEGL_RECTANGLE (0, y_height, width, =
1), 0,
> -                            NULL, pixel_row, GEGL_AUTO_ROWSTRIDE);
> -@@ -528,7 +540,7 @@ deleave_ham_row (const guchar *gimp_cmap,
> -   /* Deleave rows */
> -   for (gint i =3D 0; i < row_length; i++)
> -     {
> --      for (gint j =3D 0; j < 8; j++)
> -+      for (gint j =3D 0; j < nPlanes; j++)
> -         {
> -           guint8 bitmask =3D (1 << (8 - j)) - (1 << (7 - j));
> -           guint8 control =3D 0;
> -@@ -590,11 +602,11 @@ deleave_ham_row (const guchar *gimp_cmap,
> - }
> -
> - static void
> --deleave_rgb_row (IFF_UByte  *bitplanes,
> --                     guchar *pixel_row,
> --                     gint    width,
> --                     gint    nPlanes,
> --                     gint    pixel_size)
> -+deleave_rgb_row (IFF_UByte *bitplanes,
> -+                 guchar    *pixel_row,
> -+                 gint       width,
> -+                 gint       nPlanes,
> -+                 gint       pixel_size)
> - {
> -   gint row_length    =3D ((width + 15) / 16) * 2;
> -   gint current_pixel =3D 0;
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch b/met=
a-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
> deleted file mode 100644
> index e7821d3109..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From d30875b606085316b1cb7ac1da0d26e5bac0cf2c Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Thu, 13 Nov 2025 18:26:51 -0500
> -Subject: [PATCH] app: fix #15288 crash when loading malformed xcf
> -
> -From: Jacob Boerema <jgboerema@gmail.com>
> -
> -ZDI-CAN-28376 vulnerability
> -
> -Add extra tests to not crash on a NULL g_class.
> -
> -CVE: CVE-2025-14424
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
5cc55d078b7fba995cef77d195fac325ee288ddd]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - app/core/gimpitemlist.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/app/core/gimpitemlist.c b/app/core/gimpitemlist.c
> -index 6473938..a431519 100644
> ---- a/app/core/gimpitemlist.c
> -+++ b/app/core/gimpitemlist.c
> -@@ -345,7 +345,10 @@ gimp_item_list_named_new (GimpImage   *image,
> -   g_return_val_if_fail (GIMP_IS_IMAGE (image), NULL);
> -
> -   for (iter =3D items; iter; iter =3D iter->next)
> --    g_return_val_if_fail (g_type_is_a (G_OBJECT_TYPE (iter->data), item=
_type), NULL);
> -+    {
> -+      g_return_val_if_fail (iter->data && ((GTypeInstance*) (iter->data=
))->g_class, NULL);
> -+      g_return_val_if_fail (g_type_is_a (G_OBJECT_TYPE (iter->data), it=
em_type), NULL);
> -+    }
> -
> -   if (! items)
> -     {
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch b/met=
a-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
> deleted file mode 100644
> index 44e9587570..0000000000
> --- a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From 042e27792026460badbe49664c02fe181e95cb2b Mon Sep 17 00:00:00 2001
> -From: Gyorgy Sarvari <skandigraun@gmail.com>
> -Date: Wed, 12 Nov 2025 13:25:44 +0000
> -Subject: [PATCH] plug-ins: Mitigate ZDI-CAN-28248 for JP2 images
> -
> -From: Alx Sa <cmyk.student@gmail.com>
> -
> -Resolves #15285
> -Per the report, it's possible to exceed the size of the pixel buffer
> -with a high precision_scaled value, as we size it to the width * bpp.
> -This patch includes precision_scaled in the allocation calculation.
> -It also adds a g_size_checked_mul () check to ensure there's no
> -overflow, and moves the pixel and buffer memory freeing to occur
> -in the out section so that it always runs even on failure.
> -
> -CVE: CVE-2025-14425
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
cd1c88a0364ad1444c06536731972a99bd8643fd]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - plug-ins/common/file-jp2-load.c | 23 ++++++++++++++++-------
> - 1 file changed, 16 insertions(+), 7 deletions(-)
> -
> -diff --git a/plug-ins/common/file-jp2-load.c b/plug-ins/common/file-jp2-=
load.c
> -index 064b616..604313a 100644
> ---- a/plug-ins/common/file-jp2-load.c
> -+++ b/plug-ins/common/file-jp2-load.c
> -@@ -1045,14 +1045,15 @@ load_image (GimpProcedure     *procedure,
> -   GimpColorProfile    *profile    =3D NULL;
> -   GimpImage           *gimp_image =3D NULL;
> -   GimpLayer           *layer;
> -+  GeglBuffer          *buffer     =3D NULL;
> -+  guchar              *pixels     =3D NULL;
> -+  gsize                pixels_size;
> -   GimpImageType        image_type;
> -   GimpImageBaseType    base_type;
> -   gint                 width;
> -   gint                 height;
> -   gint                 num_components;
> --  GeglBuffer          *buffer;
> -   gint                 i, j, k, it;
> --  guchar              *pixels;
> -   const Babl          *file_format;
> -   gint                 bpp;
> -   GimpPrecision        image_precision;
> -@@ -1318,7 +1319,15 @@ load_image (GimpProcedure     *procedure,
> -   bpp =3D babl_format_get_bytes_per_pixel (file_format);
> -
> -   buffer =3D gimp_drawable_get_buffer (GIMP_DRAWABLE (layer));
> --  pixels =3D g_new0 (guchar, width * bpp);
> -+
> -+  if (! g_size_checked_mul (&pixels_size, width, (bpp * (precision_scal=
ed / 8))))
> -+    {
> -+      g_set_error (error, GIMP_PLUG_IN_ERROR, 0,
> -+                   _("Defined row size is too large in JP2 image '%s'."=
),
> -+                   gimp_file_get_utf8_name (file));
> -+      goto out;
> -+    }
> -+  pixels =3D g_new0 (guchar, pixels_size);
> -
> -   for (i =3D 0; i < height; i++)
> -     {
> -@@ -1344,13 +1353,13 @@ load_image (GimpProcedure     *procedure,
> -         gegl_buffer_set (buffer, GEGL_RECTANGLE (0, i, width, 1), 0,
> -                          file_format, pixels, GEGL_AUTO_ROWSTRIDE);
> -     }
> --
> --  g_free (pixels);
> --
> --  g_object_unref (buffer);
> -   gimp_progress_update (1.0);
> -
> -  out:
> -+  if (pixels)
> -+    g_free (pixels);
> -+  if (buffer)
> -+    g_object_unref (buffer);
> -   if (profile)
> -     g_object_unref (profile);
> -   if (image)
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.8.bb
> similarity index 92%
> rename from meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> rename to meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
> index fa192555bc..a5e892c508 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
> @@ -46,7 +46,7 @@ DEPENDS:append:libc-musl =3D " libexecinfo"
>
>  LDFLAGS:append:libc-musl =3D " -lexecinfo"
>
> -inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspe=
ction vala
> +inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspe=
ction vala bash-completion
>
>  GIR_MESON_OPTION =3D 'can-crosscompile-gir'
>  VALA_MESON_OPTION =3D "vala"
> @@ -57,16 +57,11 @@ GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
>  GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
>
>  SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
> -           file://0001-gimp-cross-compile-fix-for-bz2.patch \
>             file://0002-meson.build-reproducibility-fix.patch \
>             file://0001-meson.build-dont-check-for-lgi.patch \
>             file://0001-meson.build-require-iso-codes-native.patch \
> -           file://CVE-2025-14422.patch \
> -           file://CVE-2025-14423.patch \
> -           file://CVE-2025-14424.patch \
> -           file://CVE-2025-14425.patch \
>             "
> -SRC_URI[sha256sum] =3D "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94=
ce466a62862e296b"
> +SRC_URI[sha256sum] =3D "feb498acc01b26827cff1ff95aa8fb82cdd6a60d7abf773c=
fcd19abeafca3386"
>
>  PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
>  PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124078): https://lists.openembedded.org/g/openembedde=
d-devel/message/124078
> Mute This Topic: https://lists.openembedded.org/mt/117604891/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

