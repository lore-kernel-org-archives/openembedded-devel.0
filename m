Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B01C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.5393.1699083060403949600
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HEWvronl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z/I6Uqu2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e0608-4c539293-aae3-42be-8218-6fc6630c8874-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rZaHCh4gdvFK6fxnsxBr6tdoz6ijYYZbSDwqrnGJG0M=;
	b=HEWvronlWOMuIAFX8MKxqsVB1B2TMHy6gXPZXmUREYDL0vxUkDZGumcz9cBoMH/C
	GNVZuVJtSZuoousuTudL7vrfvTE5BiSLOrNH78F8jhwIMMKuXEChMqw638b7WM3merh
	W3/5S0OMDMj0X1XuAZQYmI+v7eF/WWeD3DySWSGA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rZaHCh4gdvFK6fxnsxBr6tdoz6ijYYZbSDwqrnGJG0M=;
	b=Z/I6Uqu2E1+9a6rJihb9JcqN+Dx9FWWtsfP6Vzi1mnZ1EYsVi9pYa7Cc9ws+vIDe
	0VXPStRdknkyUor5vNFI6RzlDliKgdYQAFxeSZ43vrpIZYV4ETEBZv7J1/gD05rtlL3
	tL8hL9rmqhg1x4ylwvNAmoUUsKthVvKdq+mEItqI=
Content-Type: multipart/mixed; boundary="===============0057019064599593060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfdesktop: upgrading to 4.19.1 FAILED
Message-ID: <0101018b993e0608-4c539293-aae3-42be-8218-6fc6630c8874-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106346

--===============0057019064599593060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfdesktop* to *4.19.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfdesktop-upgrade-4.18.1-4.19.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f93c9ae9dcbb4b53ccf5602dcc6e1f66ac11c9d0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:22:47 +0000
Subject: [PATCH] xfdesktop: upgrade 4.18.1 -> 4.19.1

---
 .../xfdesktop/{xfdesktop_4.18.1.bb => xfdesktop_4.19.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.18.1.bb => xfdesktop_4.19.1.bb} (86%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb
similarity index 86%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb
index f4d5fef8e..fe44356a7 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb
@@ -20,7 +20,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "ef9268190c25877e22a9ff5aa31cc8ede120239cb0dfca080c174e7eed4ff756"
+SRC_URI[sha256sum] = "b47b49ebf2990aedc640ac5bf3dce6a1ed610a7b05c93d8b69bd272c4b6b77e5"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.39.2


--===============0057019064599593060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4979 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:d765d335766a5df78a4827802410c400132f976d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 580 Local 571 Mirrors 0 Missed 9 Current 649 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 665 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 675 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_create_spdx_setscene)
NOTE: recipe xfdesktop-4.19.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe intltool-0.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe thunar-4.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfconf-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xfconf-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfdesktop-4.19.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 978 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe intltool-0.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe thunar-4.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 981 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1006 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: recipe xfdesktop-4.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe exo-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1042 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running task 785 of 3356 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_fetch: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 3356 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1047 of 1229 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: recipe xfdesktop-4.19.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xfdesktop-4.19.1-r0: task do_unpack: Succeeded
NOTE: Running task 3281 of 3356 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_patch)
NOTE: Running task 3302 of 3356 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3330 of 3356 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_collect_spdx_deps)
NOTE: recipe xfdesktop-4.19.1-r0: task do_patch: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_patch: Succeeded
NOTE: recipe xfdesktop-4.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfdesktop-4.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfdesktop-4.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3344 of 3356 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_configure)
NOTE: recipe xfdesktop-4.19.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/thunar/thunar_4.18.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb:do_populate_sysroot', '/h
 ome/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes
 -gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/buil
 d/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libwnck3', 'exo', 'garcon', 'libxfce4ui', 'libxfce4util', 'thunar', 'xfconf', 'glib-2.0', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'intltool', 'libtool-cross', 'libtool-native', 'quilt-native', 'gdk-pixbuf', 'gtk+3', 'hicolor-icon-theme', 'libnotify', 'cairo', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'gtk+3-native', 'wayland', 'wayland-protocols', 'libxrandr', 'libxrender', 'fontconfig', 'libpng', 'gobject-introspection', 'libxfixes', 'opkg-utils', 'at-spi2-core', 'pango', 'libxi', 'libepoxy', 'libxext', 'libjpeg-turbo', 'mesa', 'libxdamage', 'libxcursor', 'libxkbcommon', 'libxcomposite', 'libx11', 'libxres', 'startup-notification', 'xfce4-dev-tools', 'libsm', 'libice', 'attr-native', 'texinfo-dummy-native', 'libgcc', 'linux-libc-headers', 'gettext-minimal-native', 'libffi', 'bash-completion', 'libpcre2', 'zlib', 'util-linux', 'shared-mime-info', 
 'gnu-config-native', 'm4-native', 'libmpc-native', 'binutils-cross-x86_64', 'flex-native', 'gmp-native', 'mpfr-native', 'xz-native', 'zlib-native', 'zstd-native', 'libxml-parser-perl-native', 'perl', 'vala', 'libxcb', 'pixman', 'at-spi2-core-native', 'libxrender-native', 'libxrandr-native', 'libxfixes-native', 'pango-native', 'cairo-native', 'glib-2.0-native', 'python3-native', 'libx11-native', 'libpng-native', 'libxext-native', 'libxi-native', 'gdk-pixbuf-native', 'libxdamage-native', 'libxcursor-native', 'libxcomposite-native', 'gobject-introspection-native', 'fontconfig-native', 'libjpeg-turbo-native', 'xfce4-panel', 'systemd', 'desktop-file-utils', 'libxml2', 'expat', 'xorgproto', 'util-macros', 'freetype', 'python3', 'libxtst', 'dbus', 'harfbuzz', 'fribidi', 'libxft', 'vulkan-loader', 'libxshmfence', 'libdrm', 'vulkan-headers', 'libxxf86vm', 'xrandr', 'xkeyboard-config', 'xtrans', 'xcb-util', 'bzip2', 'libpam', 'util-linux-libuuid', 'libxcrypt', 'ncurses', 'libcap-ng', 'perl-na
 tive', 'expat-native', 'gdbm', 'libxau', 'xcb-proto', 'libxdmcp', 'libpthread-stubs', 'libxml2-native', 'libxtst-native', 'dbus-native', 'xorgproto-native', 'util-macros-native', 'harfbuzz-native', 'freetype-native', 'fribidi-native', 'libxft-native', 'pixman-native', 'libxcb-native', 'libsm-native', 'libffi-native', 'libpcre2-native', 'util-linux-native', 'openssl-native', 'libnsl2-native', 'libedit-native', 'ncurses-native', 'libtirpc-native', 'gdbm-native', 'sqlite3-native', 'bzip2-native', 'util-linux-libuuid-native', 'xtrans-native', 'shared-mime-info-native', 'cmake-native', 'libseccomp', 'shadow-native', 'libcap', 'kmod', 'base-files', 'zstd', 'base-passwd', 'shadow-sysroot', 'initscripts', 'shadow', 'acl', 'update-rc.d', 'sqlite3', 'xz', 'libnsl2', 'openssl', 'libedit', 'libtirpc', 'icu', 'libpciaccess', 'cracklib', 'make-native', 'icu-native', 'libxdmcp-native', 'xcb-proto-native', 'libpthread-stubs-native', 'libxau-native', 'libice-native', 'libcap-ng-native', 'itstool-nat
 ive', 'attr', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/xfdesktop-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/xfdesktop-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/xfdesktop-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/xfdesktop-4.19.1/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/xfdesktop-4.19.1/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:38: installing './compile'
| configure.ac:31: installing './missing'
| common/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfdesktop-4.19.1/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot  --disable-static  --enable-notifications --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports nested variables... (cached) yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot... none
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for library containing strerror... none required
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot... (cached) none
| checking for a sed that does not truncate output... (cached) sed
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for ctype.h... yes
| checking for errno.h... yes
| checking for fcntl.h... yes
| checking for math.h... yes
| checking for pwd.h... yes
| checking for signal.h... yes
| checking for string.h... (cached) yes
| checking for sys/param.h... yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for time.h... yes
| checking for unistd.h... (cached) yes
| checking whether NLS is requested... yes
| checking for msgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/msgmerge
| checking for ld... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot   -m elf_x86_64
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot   -m elf_x86_64) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for egrep -e... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyCurrent... no
| checking for GNU gettext in libc... yes
| checking whether to use NLS... yes
| checking where the gettext function comes from... libc
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gio-2.0 >= 2.66.0... 2.78.0
| checking GIO_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GIO_LIBS... -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gio-unix-2.0 >= 2.66.0... 2.78.0
| checking GIO_UNIX_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gio-unix-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GIO_UNIX_LIBS... -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gmodule-2.0 >= 2.66.0... 2.78.0
| checking GMODULE_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GMODULE_LIBS... -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gobject-2.0 >= 2.66.0... 2.78.0
| checking GOBJECT_CFLAGS... -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GOBJECT_LIBS... -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gthread-2.0 >= 2.66.0... 2.78.0
| checking GTHREAD_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GTHREAD_LIBS... -lgthread-2.0 -pthread -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for gtk+-3.0 >= 3.24.0... 3.24.38
| checking GTK_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gtk-3.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/at-spi2-atk/2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/at-spi-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gtk-3.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gio
 -unix-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/cairo -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/pango-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/harfbuzz -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/pango-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/fribidi -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/harfbuzz -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/atk-1.0 -I/home/pokybuild/yocto-worker/
 auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/cairo -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/pixman-1 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/freetype2 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libdrm -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gdk-pixbuf-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libpng16 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/cor
 e2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking GTK_LIBS... -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libxfce4util-1.0 >= 4.13.0... 4.18.1
| checking LIBXFCE4UTIL_CFLAGS... -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/xfce4 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking LIBXFCE4UTIL_LIBS... -lxfce4util -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libxfce4ui-2 >= 4.13.0... 4.18.3
| checking LIBXFCE4UI_CFLAGS... -pthread -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/xfce4/libxfce4ui-2 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gtk-3.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/at-spi2-atk/2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/at-spi-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysro
 ot/usr/include/gtk-3.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gio-unix-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/cairo -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/pango-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/harfbuzz -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/pango-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/fribidi -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/harfbuzz -I/home/pokyb
 uild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/atk-1.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/cairo -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/pixman-1 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/freetype2 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libdrm -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/gdk-pixbuf-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libpng16 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/b
 uild/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/libmount -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/blkid -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/xfce4 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot/usr/lib/glib-2.0/include
| checking LIBXFCE4UI_LIBS... -lxfce4ui-2 -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lxfce4util -lglib-2.0
| checking for x86_64-poky-linux-pkg-config... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for libxfce4windowing-0 >= 4.19.1... not found
| *** The required package libxfce4windowing-0 was not found on your system.
| *** Please install libxfce4windowing-0 (atleast version 4.19.1) or adjust
| *** the PKG_CONFIG_PATH environment variable if you
| *** installed the package in a nonstandard prefix so that
| *** pkg-config is able to find it.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254:286 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254, line 286
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254, line 262
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254, line 232
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254, line 152
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254, line 290
NOTE: recipe xfdesktop-4.19.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3344 tasks of which 3338 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104072215.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104072215.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfdesktop-4.19.1-r0 do_configure: configure failed
ERROR: xfdesktop-4.19.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/run.do_configure.2798254', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfdesktop/4.19.1/temp/log.do_configure.2798254
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.19.1.bb:do_configure) failed with exit code '1'

--===============0057019064599593060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfdesktop-upgrade-4.18.1-4.19.1.patch"

RnJvbSBmOTNjOWFlOWRjYmI0YjUzY2NmNTYwMmRjYzZlMWY2NmFjMTFjOWQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoyMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
ZGVza3RvcDogdXBncmFkZSA0LjE4LjEgLT4gNC4xOS4xCgotLS0KIC4uLi94ZmRlc2t0b3Ave3hm
ZGVza3RvcF80LjE4LjEuYmIgPT4geGZkZXNrdG9wXzQuMTkuMS5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEt
eGZjZS9yZWNpcGVzLXhmY2UveGZkZXNrdG9wL3t4ZmRlc2t0b3BfNC4xOC4xLmJiID0+IHhmZGVz
a3RvcF80LjE5LjEuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZj
ZS94ZmRlc2t0b3AveGZkZXNrdG9wXzQuMTguMS5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2Uv
eGZkZXNrdG9wL3hmZGVza3RvcF80LjE5LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1l
IGZyb20gbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmRlc2t0b3AveGZkZXNrdG9wXzQuMTguMS5i
YgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmRlc2t0b3AveGZkZXNrdG9wXzQu
MTkuMS5iYgppbmRleCBmNGQ1ZmVmOGUuLmZlNDQzNTZhNyAxMDA2NDQKLS0tIGEvbWV0YS14ZmNl
L3JlY2lwZXMteGZjZS94ZmRlc2t0b3AveGZkZXNrdG9wXzQuMTguMS5iYgorKysgYi9tZXRhLXhm
Y2UvcmVjaXBlcy14ZmNlL3hmZGVza3RvcC94ZmRlc2t0b3BfNC4xOS4xLmJiCkBAIC0yMCw3ICsy
MCw3IEBAIGluaGVyaXQgeGZjZSBmZWF0dXJlc19jaGVjawogCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAieDExIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWY5MjY4MTkwYzI1ODc3ZTIy
YTlmZjVhYTMxY2M4ZWRlMTIwMjM5Y2IwZGZjYTA4MGMxNzRlN2VlZDRmZjc1NiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJiNDdiNDllYmYyOTkwYWVkYzY0MGFjNWJmM2RjZTZhMWVkNjEwYTdiMDVj
OTNkOGI2OWJkMjcyYzRiNmI3N2U1IgogCiBQQUNLQUdFQ09ORklHID8/PSAibm90aWZ5IgogUEFD
S0FHRUNPTkZJR1tub3RpZnldID0gIi0tZW5hYmxlLW5vdGlmaWNhdGlvbnMsLS1kaXNhYmxlLW5v
dGlmaWNhdGlvbnMsbGlibm90aWZ5IgotLSAKMi4zOS4yCgo=

--===============0057019064599593060==--

