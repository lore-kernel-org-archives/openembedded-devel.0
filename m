Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.12860.1609959320013912007
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 10:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UGtDwdZJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id n10so2835785pgl.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o1Qynt7xopSRpOmOxAfsqHuz7WdSejTtTmmj3qS95LI=;
        b=UGtDwdZJkAMtXqC5n5c5quVzpkGtBSaeapeAEQh+THDxw11fLcWSUs42NP7RqgfegA
         gZ3+Ou0To8ECCbK67VMQh4mTHv+fJxoeERXbSk4Ho80++/gd1m5XqCjVE94LjU0MhviA
         QC5mHoTbQGLblH+gFODrGUJurlS3b32XJOwy9kXv9qjXzZoHtHXMDopmcwh1SXzIMDK7
         N4zD7yIviLKkAlDQEz7SG9fSX8VKltjB+/eHT3w/153WtsoNzXBE3CGLOy2orfrG568r
         R7E+/LWMe77mXcaE4rLC5pD6jzlWisf/K6mX1kyMA9Vv+KXAP9LGPW6aQpExy0I58+in
         txEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=o1Qynt7xopSRpOmOxAfsqHuz7WdSejTtTmmj3qS95LI=;
        b=H71dv5OBua/lWmEkHfSzmmYyCtKtseQz6p4f1hppcRKo9WduZdvnqFGEQfulu1Aee7
         60FNSmGvxp5srLzCE8BLcRcZ+FppDbwutKHyGRlMeamV6798iXrlSp1yFPNQeYE2vQB1
         jcJQpSE2tyXIhAViZXHbRSrJaEc6B+hdA1gtR6FSLseN+KHSoJHXGLlTcDoDRcw8LfsH
         djWZlAwp2t0gIuC3FxI5m6gy4BvzHXNZ/AgnEx9v5YXOED7Bzn58Fvs6+dgSkk27lLU7
         vvy59zyEivI9J4aZaB71SuooJ2HlGdVhxf4U6WRIQ+ySpoBzAgRMtbHX4grTFIXbCv8b
         bAqg==
X-Gm-Message-State: AOAM530zlNpnkqZt6GdVC5Gctzb79KhACmdDojYF/mQId2CHpuKuOyb8
	BhCm7yC1tSCaBnKaiEHpBy8=
X-Google-Smtp-Source: ABdhPJySTQfsnqfO1Db9oI42ZaNBo2hOVBEkU4YetMjJqHA1IE6YSyBMBc1KlAkXufEKEkbvRIgyKQ==
X-Received: by 2002:a62:7651:0:b029:1a5:929b:1681 with SMTP id r78-20020a6276510000b02901a5929b1681mr5074566pfc.27.1609959319435;
        Wed, 06 Jan 2021 10:55:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:30c0:6d17:4149:dc18? ([2601:646:9200:a0f0:30c0:6d17:4149:dc18])
        by smtp.gmail.com with ESMTPSA id w90sm3018662pjw.10.2021.01.06.10.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 10:55:18 -0800 (PST)
Subject: Re: [oe] [PATCH 07/28] xfwm4: upgrade 4.14.5 -> 4.16.0
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org,
 "Mittal, Anuj" <anuj.mittal@intel.com>,
 Randy MacLeod <randy.macleod@windriver.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-7-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d1bd0b10-bdd2-6820-61c1-38b7c8e5dc7e@gmail.com>
Date: Wed, 6 Jan 2021 10:55:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106151717.1779543-7-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Anuj and Randy FYI

On 1/6/21 7:16 AM, Andreas Müller wrote:
> Compositor patch does not apply anymore and testing x86-64 excceeds my
> resources. Looked into Fedora sources: They build xfwm4 un-patched either.
> 
> Release notes for 4.16.0
> ========================
> - common: Avoid zero refresh rate for monitor
> - hints: Protect against XError from XGetTransientFor()
> - netwm: Allow above/below only for regular windows
> - netwm: Mark splashscreen as transient for groups
> - client: Complete client state even on different workspaces
> - build: Increase GTK+ requirement to 3.22
> - Add `cycle_minimized` option
> - compositor: Release overlay window last
> - compositor: Free GLX data when really using GLX
> - compositor: Remove useless trace message
> - compositor: Release current GLX context on teardown
> - display: Remove custom XError handler
> - compositor: Check for XError when adding windows
> - compositor: Trap XErrors when disabling compositor
> - main: Enable compositor by default
> - compositor: Remove automatic redirect support
> - main: Add short command line options
> - main: Add debug command line option
> - pixmap: Use a safer strncpy()
> - settings: Fix compiler warning
> - Remove useless autotools macros and Makefile targets
> - Use --enable-debug=yes when compiling from git
> - Revert "compositor: Do not damage on opaque region update"
> - themes: Use smaller, lighter shadows
> - compositor: Check if compositor is enabled
> - compositor: Avoid XError when disabling compositor
> - compositor: Warn for missing epoxy GL function
> - netwm: Do not raise window if activate is set to none
> - Remove GSourceFunc casts
> - compositor: Fix build with older epoxy versions
> - settings: Add 'Always on top' to the double click action
> - Settings: Remove default alphabetical sorting of keyboard shortcuts
>    Closes: #451 (Disable initial sorting of keyboard shortcuts)
> - compositor: Handle XFixes XError
> - compositor: Add support for GL_ARB_sync
> - compositor: Return early if a Present swap is pending
> - debug: Fix build in debug mode
> - compositor: Fix compilation issue with Xpresent
> - compositor: Log fence and GLX swap time in debug mode
> - compositor: Move fence sync to redraw_glx
> - compositor: Move fence triggered to its own function
> - compositor: Set swap control if possible
> - compositor: Adjust to the actual number of buffers
> - compositor: Use a GLX drawable per buffer
> - client: Allow transients for group to be minimized
> - settings: Add a UI option for desktop zooming
> - themes: Remove title shadow
> - themes: Adjust shadows size/opacity
> - client: Make above/below consistent
> - compositor: Limit damage region to the screen
> - compositor: Optimize repaint without vblank
> - compositor: Only accumulate damage with multiple buffers
> - compositor: Copy entire content for GLX buffers
> - xsync: Handle XError
> - compositor: Ignore opaque region for shaded windows
> - compositor: Clip opaque region against window shape
> - client: Protect against XError in XKillClient()
> - compositor: Do not damage on opaque region update
> - compositor: Opaque region applies to client window
> - compositor: Reuse client size
> - client: Toggle tiling on key shortcut
> - client: Small cleanup
> - Add README.md to EXTRA_DIST
> - client: Keep tiled size of windows
> - compositor: No need to update compositor window on configure
> - compositor: Limit opaque region clipping to window extents
> - compositor: Damage on opaque region update only if visible
> - client: Send synthetic configure on force redraw
> - Post release tag bump
> - Translation Updates:
>    Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Belarusian
>    (Tarask), Bengali, Bulgarian, Catalan, Chinese (China), Chinese (Hong
>    Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern
>    Armenian, English (Australia), English (Canada), English (United
>    Kingdom), Estonian, Finnish, French, Galician, Georgian, German,
>    Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interlingue,
>    Italian, Japanese, Kazakh, Korean, Latvian, Lithuanian, Malay,
>    Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Persian
>    (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian, Russian,
>    Serbian, Slovak, Slovenian, Spanish, Swedish, Thai, Turkish,
>    Ukrainian, Urdu, Urdu (Pakistan), Uyghur
> 
> Release notes for 4.15.3
> ========================
> [Please note that this is a development release.]
> 
> - Quick release after 4.15.2 to fix a regression with opaque
>    regions leaving trails of unpainted areas on resize.
> 
> Release notes for 4.15.2
> ========================
> [Please note this is a preview release of a development version]
> 
> - Add support for opaque regions in the compositor
> - Make cursor zoom optional (xfce/xfwm4#439)
> - Remove the deprecated options "--daemon" (Pablo Mazzini)
> - Disable Xi2 support by default
> - Add column sorting in settings
> - Optimize window matching in the compositor with a hash table
>    (Michael Banack)
> - Add more XErrors traps
> - I18n: Updated translations: ar, ast, be, be@tarask, bg, bn, ca,
>    cs, da, de, el, en_AU, en_CA, en_GB, es, et, eu, fa_IR, fi, fr,
>    gl, he, hr, hu, hy_AM, hye, id, ie, is, it, ja, ka, kk, ko, lt,
>    lv, ms, nb, nl, nn, oc, pl, pt, pt_BR, ro, ru, sk, sl, sq, sr,
>    sv, th, tr, ug, uk, ur, ur_PK,
>    vi, zh_CN, zh_HK, zh_TW
>    New translations: be@tarask, fa_IR, hye, ka
> 
> Release notes for 4.15.1
> ========================
> [Please note that this is a development release.]
> 
> - Fix an error leak in compositor (xfce/xfwm4#351)
> - Fix compositor selection atom misuse
> - Prefer zero initialized memory allocation functions
> - Use g_slice allocator for compositor windows
> 
> Release notes for 4.15.0
> ========================
> [Please note that this is a development release.]
> 
> - First 4.15.x development release
> - Show tabwin only on primary monitor if set
> - All fixes and i18n as found in 4.14.4
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...r-Revert-to-GLX-as-default-vblank-me.patch | 92 -------------------
>   .../{xfwm4_4.14.5.bb => xfwm4_4.16.0.bb}      |  5 +-
>   2 files changed, 2 insertions(+), 95 deletions(-)
>   delete mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
>   rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.5.bb => xfwm4_4.16.0.bb} (82%)
> 
> diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
> deleted file mode 100644
> index 04fd623e8..000000000
> --- a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From acdceb0b28d86199b8c2233880fa8a04cb24d4d4 Mon Sep 17 00:00:00 2001
> -From: Kai Kang <kai.kang@windriver.com>
> -Date: Wed, 24 Jul 2019 09:48:04 +0800
> -Subject: [PATCH] Revert "compositor: Revert to GLX as default vblank method
> - (again)"
> -
> -This reverts commit e07574d6e7a2dbaa08c3ba4765c6306073d9493e.
> -
> -It sets the default vblank method (auto) to GLX from 4.13.2. But it
> -fails to start xfwm4 on intel-x86-64 boards with error:
> -
> -| xfwm4: ../mesa-19.1.1/src/mesa/drivers/dri/i965/intel_mipmap_tree.c:1293:
> -| intel_miptree_match_image: Assertion `image->TexObject->Target == mt->target' failed.
> -| Aborted
> -
> -There is also a RHEL defect:
> -https://bugzilla.redhat.com/show_bug.cgi?id=1678334
> -
> -Revert the commit to fix the issue.
> -
> -Upstream-Status: Inappropriate [workaround]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - src/compositor.c | 41 +++++++++++++++++++----------------------
> - 1 file changed, 19 insertions(+), 22 deletions(-)
> -
> -diff --git a/src/compositor.c b/src/compositor.c
> -index 25615282..daced607 100644
> ---- a/src/compositor.c
> -+++ b/src/compositor.c
> -@@ -4483,13 +4483,28 @@ compositorManageScreen (ScreenInfo *screen_info)
> -     XClearArea (display_info->dpy, screen_info->output, 0, 0, 0, 0, TRUE);
> -     TRACE ("manual compositing enabled");
> -
> -+#ifdef HAVE_PRESENT_EXTENSION
> -+    screen_info->use_present = display_info->have_present &&
> -+                               (screen_info->vblank_mode == VBLANK_AUTO ||
> -+                                screen_info->vblank_mode == VBLANK_XPRESENT);
> -+    if (screen_info->use_present)
> -+    {
> -+        screen_info->present_pending = FALSE;
> -+        XPresentSelectInput (display_info->dpy,
> -+                             screen_info->output,
> -+                             PresentCompleteNotifyMask);
> -+    }
> -+#else /* HAVE_PRESENT_EXTENSION */
> -+    screen_info->use_present = FALSE;
> -+#endif /* HAVE_PRESENT_EXTENSION */
> -+
> - #ifdef HAVE_EPOXY
> --    screen_info->use_glx = (screen_info->vblank_mode == VBLANK_AUTO ||
> --                            screen_info->vblank_mode == VBLANK_GLX);
> -+    screen_info->use_glx = !screen_info->use_present &&
> - #ifdef HAVE_XSYNC
> --    screen_info->use_glx &= display_info->have_xsync;
> -+                            display_info->have_xsync &&
> - #endif /* HAVE_XSYNC */
> --
> -+                            (screen_info->vblank_mode == VBLANK_AUTO ||
> -+                             screen_info->vblank_mode == VBLANK_GLX);
> -     if (screen_info->use_glx)
> -     {
> -         screen_info->glx_context = None;
> -@@ -4503,24 +4518,6 @@ compositorManageScreen (ScreenInfo *screen_info)
> -     screen_info->use_glx = FALSE;
> - #endif /* HAVE_EPOXY */
> -
> --#ifdef HAVE_PRESENT_EXTENSION
> --    screen_info->use_present = display_info->have_present &&
> --#ifdef HAVE_EPOXY
> --                               !screen_info->use_glx &&
> --#endif /* HAVE_EPOXY */
> --                               (screen_info->vblank_mode == VBLANK_AUTO ||
> --                                screen_info->vblank_mode == VBLANK_XPRESENT);
> --    if (screen_info->use_present)
> --    {
> --        screen_info->present_pending = FALSE;
> --        XPresentSelectInput (display_info->dpy,
> --                             screen_info->output,
> --                             PresentCompleteNotifyMask);
> --    }
> --#else /* HAVE_PRESENT_EXTENSION */
> --    screen_info->use_present = FALSE;
> --#endif /* HAVE_PRESENT_EXTENSION */
> --
> -     if (screen_info->use_present)
> -     {
> -         g_info ("Compositor using XPresent for vsync");
> ---
> -2.20.1
> -
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
> similarity index 82%
> rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
> rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
> index f8febe804..3f64365f0 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
> @@ -2,14 +2,13 @@ DESCRIPTION = "Xfce4 Window Manager"
>   SECTION = "x11/wm"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
> -DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama exo-native"
> +DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama"
>   
>   inherit xfce update-alternatives features_check
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> -SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
> -SRC_URI[sha256sum] = "d7a7c63fa42ec6d7cb3caab130d6f496be5bd7689b775d20e8786b7f3e282930"
> +SRC_URI[sha256sum] = "1e22eae1bbb66cebfd1753b0a5606e76ecbf6b09ce4cdfd732d093c936f1feb3"
>   
>   PACKAGECONFIG ?= " \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
> 
> 
> 
> 
> 
