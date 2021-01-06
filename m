Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.9591.1609946259140781602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LYKzm/uE;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id cw27so4714922edb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=du/klrFkefgWI3eWdjc9f0CTkN4NPqxPEBoP62X6W/U=;
        b=LYKzm/uEBAR4RQKhUFrhgdzElzwszCWEEN/2EEPDGGsxGQobfz27beYrzlRSt3vPIl
         ww5IKDVG2+3CGRYjZ62gUfdOLTX1ZUQjT3jAg6K98AH/Nv+wJwFDElEV7j+liAEfI+6G
         jCXeVyPrJ2qdwLKO+nNPAdL5dRziCfsZ0tvGPaVC9zODdJC96S/cfXgVEF2JcWA9o9Jh
         G+PEWaVvc3Mk7+A0ywKoW+spA5F9mNga55dWsF4LFXoQ4fdC8hcKTZ1swR6dHesqotPP
         KyQecI5u1l2LBIGWJ7q+FQR4bKoj54hlckwQa7XixFn5DikuPI75fb7pHECKQCBvlkSj
         19Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=du/klrFkefgWI3eWdjc9f0CTkN4NPqxPEBoP62X6W/U=;
        b=ZdVhZraGcbmMaxw8GQY7++kjfF7IwHVKPrdzVUUD1CiB1YH13Whgs+YffMOwfWNq6y
         XgGG2Unz6hKDB40Th+5/Cy+r0hNSljVTPCQOlGqig5KYazgwkaQzDf7dOl16LoSC62qP
         BKG6vEW5F3lvzyMp5xMBpoCInp9/SUfTTToK8WCRWbQ2iZFSTiPkRljNwOmrp4tHKPiD
         FIEO7PiOR444SDrXQZhb4LNamyAI+0R5H2aorXkUKyijwb8NR3styMC4iySeyH/gckxB
         DCFdLdhf3n+JqY7GafevvZSSmncPhx9cZz76bG8lcBy1dgW2XvLeLxahc6lvx6amviNK
         d2eQ==
X-Gm-Message-State: AOAM533lcxvfcq49f+qjegHxB5gE1MRMUj7RN6OuLGepUgVmBMlg1Ehp
	zPUlQl8ZNOec3N2APG2gQYsELZI/EpAfmg==
X-Google-Smtp-Source: ABdhPJySMOgkzBSiukdmih5l3v9cwxUJkFNJXJDe8cl3OgDU8gkZJbt2D7Mq5aHoD/wIHuwob8dJFA==
X-Received: by 2002:a05:6402:1a2f:: with SMTP id be15mr4321164edb.209.1609946257691;
        Wed, 06 Jan 2021 07:17:37 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:36 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/28] xfwm4: upgrade 4.14.5 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:56 +0100
Message-Id: <20210106151717.1779543-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compositor patch does not apply anymore and testing x86-64 excceeds my
resources. Looked into Fedora sources: They build xfwm4 un-patched either.

Release notes for 4.16.0
========================
- common: Avoid zero refresh rate for monitor
- hints: Protect against XError from XGetTransientFor()
- netwm: Allow above/below only for regular windows
- netwm: Mark splashscreen as transient for groups
- client: Complete client state even on different workspaces
- build: Increase GTK+ requirement to 3.22
- Add `cycle_minimized` option
- compositor: Release overlay window last
- compositor: Free GLX data when really using GLX
- compositor: Remove useless trace message
- compositor: Release current GLX context on teardown
- display: Remove custom XError handler
- compositor: Check for XError when adding windows
- compositor: Trap XErrors when disabling compositor
- main: Enable compositor by default
- compositor: Remove automatic redirect support
- main: Add short command line options
- main: Add debug command line option
- pixmap: Use a safer strncpy()
- settings: Fix compiler warning
- Remove useless autotools macros and Makefile targets
- Use --enable-debug=yes when compiling from git
- Revert "compositor: Do not damage on opaque region update"
- themes: Use smaller, lighter shadows
- compositor: Check if compositor is enabled
- compositor: Avoid XError when disabling compositor
- compositor: Warn for missing epoxy GL function
- netwm: Do not raise window if activate is set to none
- Remove GSourceFunc casts
- compositor: Fix build with older epoxy versions
- settings: Add 'Always on top' to the double click action
- Settings: Remove default alphabetical sorting of keyboard shortcuts
  Closes: #451 (Disable initial sorting of keyboard shortcuts)
- compositor: Handle XFixes XError
- compositor: Add support for GL_ARB_sync
- compositor: Return early if a Present swap is pending
- debug: Fix build in debug mode
- compositor: Fix compilation issue with Xpresent
- compositor: Log fence and GLX swap time in debug mode
- compositor: Move fence sync to redraw_glx
- compositor: Move fence triggered to its own function
- compositor: Set swap control if possible
- compositor: Adjust to the actual number of buffers
- compositor: Use a GLX drawable per buffer
- client: Allow transients for group to be minimized
- settings: Add a UI option for desktop zooming
- themes: Remove title shadow
- themes: Adjust shadows size/opacity
- client: Make above/below consistent
- compositor: Limit damage region to the screen
- compositor: Optimize repaint without vblank
- compositor: Only accumulate damage with multiple buffers
- compositor: Copy entire content for GLX buffers
- xsync: Handle XError
- compositor: Ignore opaque region for shaded windows
- compositor: Clip opaque region against window shape
- client: Protect against XError in XKillClient()
- compositor: Do not damage on opaque region update
- compositor: Opaque region applies to client window
- compositor: Reuse client size
- client: Toggle tiling on key shortcut
- client: Small cleanup
- Add README.md to EXTRA_DIST
- client: Keep tiled size of windows
- compositor: No need to update compositor window on configure
- compositor: Limit opaque region clipping to window extents
- compositor: Damage on opaque region update only if visible
- client: Send synthetic configure on force redraw
- Post release tag bump
- Translation Updates:
  Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Belarusian
  (Tarask), Bengali, Bulgarian, Catalan, Chinese (China), Chinese (Hong
  Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern
  Armenian, English (Australia), English (Canada), English (United
  Kingdom), Estonian, Finnish, French, Galician, Georgian, German,
  Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interlingue,
  Italian, Japanese, Kazakh, Korean, Latvian, Lithuanian, Malay,
  Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Persian
  (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian, Russian,
  Serbian, Slovak, Slovenian, Spanish, Swedish, Thai, Turkish,
  Ukrainian, Urdu, Urdu (Pakistan), Uyghur

Release notes for 4.15.3
========================
[Please note that this is a development release.]

- Quick release after 4.15.2 to fix a regression with opaque
  regions leaving trails of unpainted areas on resize.

Release notes for 4.15.2
========================
[Please note this is a preview release of a development version]

- Add support for opaque regions in the compositor
- Make cursor zoom optional (xfce/xfwm4#439)
- Remove the deprecated options "--daemon" (Pablo Mazzini)
- Disable Xi2 support by default
- Add column sorting in settings
- Optimize window matching in the compositor with a hash table
  (Michael Banack)
- Add more XErrors traps
- I18n: Updated translations: ar, ast, be, be@tarask, bg, bn, ca,
  cs, da, de, el, en_AU, en_CA, en_GB, es, et, eu, fa_IR, fi, fr,
  gl, he, hr, hu, hy_AM, hye, id, ie, is, it, ja, ka, kk, ko, lt,
  lv, ms, nb, nl, nn, oc, pl, pt, pt_BR, ro, ru, sk, sl, sq, sr,
  sv, th, tr, ug, uk, ur, ur_PK,
  vi, zh_CN, zh_HK, zh_TW
  New translations: be@tarask, fa_IR, hye, ka

Release notes for 4.15.1
========================
[Please note that this is a development release.]

- Fix an error leak in compositor (xfce/xfwm4#351)
- Fix compositor selection atom misuse
- Prefer zero initialized memory allocation functions
- Use g_slice allocator for compositor windows

Release notes for 4.15.0
========================
[Please note that this is a development release.]

- First 4.15.x development release
- Show tabwin only on primary monitor if set
- All fixes and i18n as found in 4.14.4

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...r-Revert-to-GLX-as-default-vblank-me.patch | 92 -------------------
 .../{xfwm4_4.14.5.bb => xfwm4_4.16.0.bb}      |  5 +-
 2 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.5.bb => xfwm4_4.16.0.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
deleted file mode 100644
index 04fd623e8..000000000
--- a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From acdceb0b28d86199b8c2233880fa8a04cb24d4d4 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Wed, 24 Jul 2019 09:48:04 +0800
-Subject: [PATCH] Revert "compositor: Revert to GLX as default vblank method
- (again)"
-
-This reverts commit e07574d6e7a2dbaa08c3ba4765c6306073d9493e.
-
-It sets the default vblank method (auto) to GLX from 4.13.2. But it
-fails to start xfwm4 on intel-x86-64 boards with error:
-
-| xfwm4: ../mesa-19.1.1/src/mesa/drivers/dri/i965/intel_mipmap_tree.c:1293:
-| intel_miptree_match_image: Assertion `image->TexObject->Target == mt->target' failed.
-| Aborted
-
-There is also a RHEL defect:
-https://bugzilla.redhat.com/show_bug.cgi?id=1678334
-
-Revert the commit to fix the issue.
-
-Upstream-Status: Inappropriate [workaround]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- src/compositor.c | 41 +++++++++++++++++++----------------------
- 1 file changed, 19 insertions(+), 22 deletions(-)
-
-diff --git a/src/compositor.c b/src/compositor.c
-index 25615282..daced607 100644
---- a/src/compositor.c
-+++ b/src/compositor.c
-@@ -4483,13 +4483,28 @@ compositorManageScreen (ScreenInfo *screen_info)
-     XClearArea (display_info->dpy, screen_info->output, 0, 0, 0, 0, TRUE);
-     TRACE ("manual compositing enabled");
- 
-+#ifdef HAVE_PRESENT_EXTENSION
-+    screen_info->use_present = display_info->have_present &&
-+                               (screen_info->vblank_mode == VBLANK_AUTO ||
-+                                screen_info->vblank_mode == VBLANK_XPRESENT);
-+    if (screen_info->use_present)
-+    {
-+        screen_info->present_pending = FALSE;
-+        XPresentSelectInput (display_info->dpy,
-+                             screen_info->output,
-+                             PresentCompleteNotifyMask);
-+    }
-+#else /* HAVE_PRESENT_EXTENSION */
-+    screen_info->use_present = FALSE;
-+#endif /* HAVE_PRESENT_EXTENSION */
-+
- #ifdef HAVE_EPOXY
--    screen_info->use_glx = (screen_info->vblank_mode == VBLANK_AUTO ||
--                            screen_info->vblank_mode == VBLANK_GLX);
-+    screen_info->use_glx = !screen_info->use_present &&
- #ifdef HAVE_XSYNC
--    screen_info->use_glx &= display_info->have_xsync;
-+                            display_info->have_xsync &&
- #endif /* HAVE_XSYNC */
--
-+                            (screen_info->vblank_mode == VBLANK_AUTO ||
-+                             screen_info->vblank_mode == VBLANK_GLX);
-     if (screen_info->use_glx)
-     {
-         screen_info->glx_context = None;
-@@ -4503,24 +4518,6 @@ compositorManageScreen (ScreenInfo *screen_info)
-     screen_info->use_glx = FALSE;
- #endif /* HAVE_EPOXY */
- 
--#ifdef HAVE_PRESENT_EXTENSION
--    screen_info->use_present = display_info->have_present &&
--#ifdef HAVE_EPOXY
--                               !screen_info->use_glx &&
--#endif /* HAVE_EPOXY */
--                               (screen_info->vblank_mode == VBLANK_AUTO ||
--                                screen_info->vblank_mode == VBLANK_XPRESENT);
--    if (screen_info->use_present)
--    {
--        screen_info->present_pending = FALSE;
--        XPresentSelectInput (display_info->dpy,
--                             screen_info->output,
--                             PresentCompleteNotifyMask);
--    }
--#else /* HAVE_PRESENT_EXTENSION */
--    screen_info->use_present = FALSE;
--#endif /* HAVE_PRESENT_EXTENSION */
--
-     if (screen_info->use_present)
-     {
-         g_info ("Compositor using XPresent for vsync");
--- 
-2.20.1
-
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
index f8febe804..3f64365f0 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
@@ -2,14 +2,13 @@ DESCRIPTION = "Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama exo-native"
+DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama"
 
 inherit xfce update-alternatives features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[sha256sum] = "d7a7c63fa42ec6d7cb3caab130d6f496be5bd7689b775d20e8786b7f3e282930"
+SRC_URI[sha256sum] = "1e22eae1bbb66cebfd1753b0a5606e76ecbf6b09ce4cdfd732d093c936f1feb3"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.26.2

