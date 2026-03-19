Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8CF1091919
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 20:39:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5840.1773952794370207403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 13:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSARppU0;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso15116775e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773952793; x=1774557593; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBZOtddYXm/zUKruQN7gbMy4tO7A17H4k/wlRaGk8Sk=;
        b=VSARppU00N2jRGLe9IQjHWBn2TKzXTUOTifn15YlEs/w1u6so4+c3pioZw1bVtV5lJ
         okpd9w9A3+BIb3Zql+nUIeb9NRdQNGIrXGMLlonACGRFRYKRVtoqhLlWOnbmCUGinHG0
         K4qorcrfP6u0keXmXc9bHLlZggSMyQzpi4YC+aFerLrbaqgiizF3v0QQ5G9wHJwd3K8U
         xkNB7G4LIR8NcEkKv99cu5iZK/PIB4+1VX3MtzNTc5hCGiBaDjnbPycY02H+wOC9HSk+
         QqP0FhR1zwkO2ApfpFcUC3RGi1QPf1VlUFFNh7tVk0yMJqPBpmFUSNKPJBLsjbxMlJKg
         UVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952793; x=1774557593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBZOtddYXm/zUKruQN7gbMy4tO7A17H4k/wlRaGk8Sk=;
        b=q6f5lxNh8iRN7LeETfDXH8R3TdZ3xpzWGlhVKx6osMyhWynyvRkRNWVAR6qb8Lcu/t
         ht2Q/cOLpU25vTfRxxoYllzjWWiF4fUHib49rSiBVUhDyhQK25/cy6SYe2du+H6ErtVr
         Rk4vALrsZyTi5HZ2hYScGfu891r4OKcnp6ce/za2jPN3r3weHMCs4xNF/7qfKcoJSyaL
         MvUzbobkJ1NyZphc8Na6PGTjQvf6RQ7k69QsrbSjPebVz6FCIVaD7itsgal/qhigQM3X
         FXQd9YALzKkJacICIBl7B3tDEfbMLtt4gx46E+EBSRCBqEmR2zqfXqXzyZrvJRzsGgfq
         0geg==
X-Gm-Message-State: AOJu0YwXyEF0u9MSqVRVZOTFgoKMIKqY5eZ2HsVcIwtWAWGb/xNHMLqs
	XNiIAhuzxbxzqXmPhCmBAKBMY/VGDHOqAfXmCxK8QQZvjj9TcxVtR6mgiLgU/g==
X-Gm-Gg: ATEYQzyEsloSeiILtbk/zWWDVWaWavO2Kf6q15DKj1hKmejwUroZWtPIGdpyHi3fwzu
	Dnl/dAFtyo+5Thni/xb2lgRgDSpNrdkGUdRhbVdE8hsZkXIqr22fJiUxFoaXU9fKple7sE2aGIU
	oNOhd1KWJYGq7Tn06nVm5GODcX+nkYub2gpqpgF41xd7OhWpkGCvBSt7mGrRP/MKqI1MZ0Qf54M
	wRlafgIweUvOzqSOUsBDy9tnVGCkal19QDcFv0AYjj2JHfyeR/GrRAn4arbfWjmJbBGVre9KhpX
	LCNTsrvs1vrjs242aF+7Y7203O273GgsRWGAFakyRs3W9Or1SDdXwokyTwOexWM5XQBEOaHTA9p
	hLAMbX09R0IZrhulIyGG4YrKzIcMTCEaS+Ylbiaa3b3vaW4HMi9KM8/HZc1NtytVFpc2EqeXsYz
	K2fzeRt93Z7KNlM8cGxL7DU0xQZgeV3CA=
X-Received: by 2002:a05:600c:8119:b0:485:54cc:2e7c with SMTP id 5b1f17b1804b1-486ff034137mr6125075e9.24.1773952792564;
        Thu, 19 Mar 2026 13:39:52 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1ce0b9sm2155535e9.6.2026.03.19.13.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 13:39:52 -0700 (PDT)
Message-ID: <d1656f73-13d0-47ef-9ad1-a2b71175b2bb@gmail.com>
Date: Thu, 19 Mar 2026 21:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH] gedit: upgrade 46.2 -> 49.0
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
References: <189E589145FDCC75.3006288@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189E589145FDCC75.3006288@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 20:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125415

Khem,

This patch requires your libtepl and libgedit-gtksourceview updates from
master-next - if you merge this, you will need to promote those too.

On 3/19/26 21:38, Gyorgy Sarvari via lists.openembedded.org wrote:
> Switched to fetch from git, because the related tarball is not available
> (yet?) in the gnome download server.
> 
> Dropped patch that became unnecessary.
> 
> Changelog:
> 
> News in 49.0, 2026-01-03
> ------------------------
> 
> * Metainfo data: add more infos to fix Flathub warnings.
> * Cleanup: remove BuildStream and Snap from build-aux/ (outdated).
> * Translation updates.
> 
> News in 49.alpha2, 2025-11-17
> -----------------------------
> 
> User-visible changes:
> * Add a max-file-size setting for document loading, fixing the common problem
>   with very large files.
> * New symbolic app icon (to have a square one).
> * Statusbar: fix a bug with the language button popover.
> 
> Under the hood changes:
> * Fix a compilation warning.
> * Statusbar:
>   - Move some features of GeditStatusbar to libgedit-tepl as TeplStatusbar.
>   - GeditWindowStatus: new internal class to offload some work that was done in
>     GeditWindow, to avoid a god class.
>   - *.ui -> code.
> 
> Other:
> * Translation updates.
> * Tools: generate-html-list-of-plugins-description.sh script (output HTML
>   content that is put on the website instead of generating a Markdown file
>   located in the git repository).
> 
> News in 49.alpha1, 2025-09-05
> -----------------------------
> 
> User-visible changes:
> * gedit icon: take an older version for small sizes. The older version looks
>   nicer.
> * Code Comment/Uncomment plugin: some bugs have been fixed, and the behavior can
>   be slightly different in some situations. A new user manual page has also been
>   written.
> * Setup allowed GDK backends to disable Wayland. Only the X11 backend is allowed
>   on Linux (so it relies on XWayland when running the application on a Wayland
>   session). It fixes some bugs, especially for the Word Completion plugin.
> 
> Under the hood changes:
> * Tools: add generate-c-plugin, to generate the boilerplate C code for a new
>   plugin.
> * Code Comment/Uncomment plugin: rewrite it in C, and have the bulk of the
>   implementation in libgedit-tepl.
> * Port to new GtkSourceEncoding API.
> * GeditTab refactorings:
>   - Extract gedit-tab-utils.c.
>   - Start to extract GeditTabLoader (private class).
> * Various other code refactorings.
> 
> Developer documentation:
> * Improve the developer documentation, and start to write the
>   “Gedit Development Guidelines”.
> * Improve API docs of the Activatable classes.
> 
> Other:
> * Metainfo data: add a donation URL.
> * Translation updates.
> 
> News in 48.2, 2025-04-14
> ------------------------
> 
> * Update links to new website domain name: https://gedit-text-editor.org/
> 
> * It is no longer possible to implement plugins in Python.
> 
> * New features:
>   - Reset All button in the preferences dialog.
>   - In the Spell Checker plugin: be able to configure the default language used
>     for the spell-checking in new documents.
> 
> * Code refactorings:
>   - In GeditWindow and GeditPreferencesDialog.
>   - Don't use the g_slice_*() functions (deprecated).
>   - In the Spell Checker plugin.
> 
> * MS Windows: change default font to Consolas.
> * macOS: install an icon (work by LI Daobing).
> * Metainfo: improve it (work by Daniel Rusek).
> * Some updates to the user manual.
> * Improve the devel documentation.
> * Translation updates.
> 
> News in 48.1, 2024-12-07
> ------------------------
> This is _not_ a bug-fix release, it contains other changes. The current plan is
> to release gedit 49.0 at the same time as GNOME 49.0, to come back to the same
> numbers as GNOME, but with more frequent releases like this one.
> 
> * Removed plugins: External Tools, Snippets, Python Console.
> * Text Size plugin: rewrite in C.
> * Remove the background-pattern feature (with the grid).
> * Fix bug on Wayland to unmaximize the window.
> * Code refactorings.
> * Fix compilation warning.
> * Translation updates.
> 
> News in 48.0, 2024-09-14
> ------------------------
> New features:
> * Full support of light/dark GTK theme variants. Configuration is done in the
>   Preferences dialog -> Font & Colors.
> 
> Visible changes:
> * Add missing tooltips to some buttons (Sabri Ünal).
> * The Text Size plugin has been moved from gedit-plugins to this repository, and
>   is now enabled by default.
> * Remove Quick Open plugin.
> * Mark some plugins as "buggy plugins": External Tools and Snippets.
> 
> Bug fixes:
> * Fix some warning messages that appeared at runtime.
> * Fix a crash.
> 
> For Microsoft Windows:
> * Add Portable Executable resource icon, to associate an icon with the
>   executable (Hernan Martinez, gwillems and Sébastien Wilmet).
> * Make gedit work without patches for MINGW-packages.
> 
> Misc:
> * Some code refactorings.
> * Update the user manual for the new feature ("Change the color scheme" page).
> * Side panel: adapt to latest libgedit-tepl API.
> * Bottom panel: port to TeplPanel.
> * Build instructions: Meson refactorings.
> * Translation updates (GNOME Translation Project contributors).
> 
> -- Sébastien Wilmet (main contributor and reviewer).
> 
> News in 47.0, 2024-04-27 (stable version)
> -----------------------------------------
> Web presence:
> * New website for gedit: https://gedit-technology.github.io/apps/gedit/
> * Update URLs for gedit-technology.net -> https://gedit-technology.github.io/
> * Start to migrate away from wiki.gnome.org.
> 
> Branding:
> * Restore the previous app icons and logo.
> 
> New features:
> * Experimental: add light/dark GTK theme variant configuration (as a hidden
>   GSettings key for now).
> 
> Removed features:
> * Localization (l10n): all the translations are disabled, gedit is available in
>   English only because some underlying modules are not on l10n.gnome.org or
>   equivalent.
> * In the preferences dialog, remove the toolbar to install/uninstall color
>   schemes. Third-party color schemes are still supported, but the XML file(s)
>   need to be copied into the right directory by another means, see:
>   https://gedit-technology.github.io/developer-docs/extra/libgedit-gtksourceview/style-schemes.html
>   or also the gedit user help documentation.
> 
> Under-the-hood changes:
> * Adapt the code for libgedit-gtksourceview API changes.
> * Adapt the code for the Tepl -> libgedit-tepl module rename.
> * Code refactorings, various improvements and bug fixes.
> * Continue to reduce usage of *.ui files, write code instead.
> * Use newer GLib API at some places.
> * Add -Wshadow to the CFLAGS and fix the corresponding warnings.
> 
> For plugins:
> * Some API changes (see the page documenting the API breaks).
> * Improve the API documentation.
> 
> Misc:
> * Rename *.appdata.xml to *.metainfo.xml and do some updates to that file.
> * Update documentation for contributors.
> * Links to some third-party plugins.
> 
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../gedit/gedit/0001-fix-for-clang-18.patch   | 32 -------------------
>  .../gedit/{gedit_46.2.bb => gedit_49.0.bb}    |  4 +--
>  2 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.patch
>  rename meta-gnome/recipes-gnome/gedit/{gedit_46.2.bb => gedit_49.0.bb} (88%)
> 
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.patch b/meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.patch
> deleted file mode 100644
> index 40fd93b984..0000000000
> --- a/meta-gnome/recipes-gnome/gedit/gedit/0001-fix-for-clang-18.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> -Upstream-Status: Inappropriate [https://gitlab.gnome.org/GNOME/gedit/-/issues/588]
> -
> -Temporary workaround to fix build:
> -../plugins/quickhighlight/gedit-quick-highlight-plugin.c: In function ‘gedit_quick_highlight_plugin_load_style’:
> -../plugins/quickhighlight/gedit-quick-highlight-plugin.c:96:47: error: implicit declaration of function ‘gtk_source_style_copy’; did you mean ‘gtk_source_style_apply’? [-Wimplicit-function-declaration]
> -
> -   96 |                         plugin->priv->style = gtk_source_style_copy (style);
> -      |                                               ^~~~~~~~~~~~~~~~~~~~~
> -      |                                               gtk_source_style_apply
> -../plugins/quickhighlight/gedit-quick-highlight-plugin.c:96:47: warning: nested extern declaration of ‘gtk_source_style_copy’ [-Wnested-externs]
> -../plugins/quickhighlight/gedit-quick-highlight-plugin.c:96:45: error: assignment to ‘GtkSourceStyle *’ {aka ‘struct _GtkSourceStyle *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
> -   96 |                         plugin->priv->style = gtk_source_style_copy (style);
> -      |                                             ^
> -
> ---- a/plugins/quickhighlight/gedit-quick-highlight-plugin.c	2024-02-20 08:11:47.925749255 +0100
> -+++ b/plugins/quickhighlight/gedit-quick-highlight-plugin.c	2024-02-20 08:12:16.218594067 +0100
> -@@ -90,11 +90,12 @@
> - 	if (style_scheme != NULL)
> - 	{
> - 		style = gtk_source_style_scheme_get_style (style_scheme, "quick-highlight-match");
> --
> -+#if 0
> - 		if (style != NULL)
> - 		{
> - 			plugin->priv->style = gtk_source_style_copy (style);
> - 		}
> -+#endif
> - 	}
> - }
> - 
> -
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_49.0.bb
> similarity index 88%
> rename from meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
> rename to meta-gnome/recipes-gnome/gedit/gedit_49.0.bb
> index 91b2221d7a..15b14b2c90 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_49.0.bb
> @@ -23,8 +23,8 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc get
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>  
> -SRC_URI += "file://0001-fix-for-clang-18.patch"
> -SRC_URI[archive.sha256sum] = "c0866412bad147ebace2d282ffcbb5a0e9a304b20fd55640bee21c81e6d501ef"
> +SRC_URI = "git://gitlab.gnome.org/World/gedit/gedit.git;protocol=https;branch=master;tag=${PV}"
> +SRCREV = "684abd8299139e1a3b87446da501ad034e78c840"
>  
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125414): https://lists.openembedded.org/g/openembedded-devel/message/125414
> Mute This Topic: https://lists.openembedded.org/mt/118407722/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


