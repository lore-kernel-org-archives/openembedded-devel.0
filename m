Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E2C064F9
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5516.1699083060412012216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M0LO+yRD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dJ9o3Ecm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e057f-1446ae75-ef1c-4eec-8399-c5e1ee1b0f5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S2OLf/0NkhyLQokN0hUNnUZJsIG0JOvcMTGhi2TaVh0=;
	b=M0LO+yRDHR6NGZ2EZOi6ehybrrWxFL9kci03G3urzUGyxm670emftl2RH5fT2YIj
	QA6oi+GToYBZ+AZ+UdFsrGcE5oMYRPy8GgyPN1vgpTVNGZ+x4X1LakgNc1j8y4tefCQ
	raQu/kKvvus6CRg6DUbEeWIMsFgoFi8UeZSS+EoY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S2OLf/0NkhyLQokN0hUNnUZJsIG0JOvcMTGhi2TaVh0=;
	b=dJ9o3EcmuljoO8cBLja5y3Yi4TEw9IPkM3o06+s8Ww7XauFMWOXflnJk7Qnj/J9H
	Rru3lZdJn635vdNfGbuGwlEre3viG2YdpImUYrFOClAu9ad2ZzVvfbtHj1Mg4cSVgMt
	Wi9r4iXeoz2XOXLGF7ibD/sLBtjJbVpEY++bXfFo=
Content-Type: multipart/mixed; boundary="===============2687193738549744930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-xkb-plugin: upgrading to 0.8.3 FAILED
Message-ID: <0101018b993e057f-1446ae75-ef1c-4eec-8399-c5e1ee1b0f5a-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106349

--===============2687193738549744930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfce4-xkb-plugin* to *0.8.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfce4-xkb-plugin-upgrade-0.8.2-0.8.3.patch
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
From 70267801222deed6300eb181635211efa969c956 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:18:34 +0000
Subject: [PATCH] xfce4-xkb-plugin: upgrade 0.8.2 -> 0.8.3

---
 .../{xfce4-xkb-plugin_0.8.2.bb => xfce4-xkb-plugin_0.8.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.2.bb => xfce4-xkb-plugin_0.8.3.bb} (83%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb
similarity index 83%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb
index 3d935a3d7..795e4fc4e 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "bb4be13f6f73cd86a6d939e1a6b125841cf266415bc4fd134a511e4f0cf97967"
+SRC_URI[sha256sum] = "f0bfe97875ef1ca0a3b6a6fac312663c9cada151cf1ac96071393d320cd04987"
 
 DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
-- 
2.39.2


--===============2687193738549744930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4975 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:61ce6e44b9d132088269b29f0c5b5500c8ce9899"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 760 Local 751 Mirrors 0 Missed 9 Current 696 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 705 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 714 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xfce4-settings-4.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwnck3-43.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwnck3-43.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 992 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe xfce4-settings-4.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 998 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1006 of 1456 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxklavier-5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxklavier-5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3617 of 3941 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_fetch)
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_fetch: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 3923 of 3941 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_unpack)
NOTE: Running task 3924 of 3941 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_unpack: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 3925 of 3941 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_patch)
NOTE: Running task 3926 of 3941 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_patch: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3929 of 3941 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_configure)
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.18.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/hom
 e/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta
 -oe/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
  'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libwnck3', 'libxklavier', 'garcon', 'libxfce4ui', 'libxfce4util', 'xfce4-panel', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'gdk-pixbuf', 'gtk+3', 'hicolor-icon-theme', 'librsvg', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'gtk+3-native', 'glib-2.0', 'gobject-introspection', 'vala', 'libjpeg-turbo-native', 'libxcomposite-native', 'libxrandr-native', 'libxfixes-native', 'libxi-native', 'pango-native', 'cairo-native', 'libx11-native', 'gettext-minimal-native', 'gdk-pixbuf-native', 'python3-native', 'libxext-native', 'libpng-native', 'gobject-introspection-native', 'libxdamage-native', 'libxcursor-native', 'glib-2.0-native', 'at-spi2-core-native', 'fontconfig-native', 'libxrender-native', 'xz-native', 'desktop-file-utils', 'libxml2', 'libx11', 'cairo', 'exo', 'libxres', 'startup-notification', 'xfce4-dev
 -tools', 'libepoxy', 'xfconf', 'libice', 'libsm', 'libstd-rs', 'pango', 'libxml-parser-perl-native', 'linux-libc-headers', 'libgcc', 'texinfo-dummy-native', 'libxi', 'gtk+', 'iso-codes', 'xkbcomp', 'binutils-cross-x86_64', 'libpng', 'libjpeg-turbo', 'shared-mime-info', 'attr-native', 'gnu-config-native', 'm4-native', 'opkg-utils', 'fontconfig', 'libxrender', 'libxfixes', 'libxcomposite', 'mesa', 'libxext', 'wayland', 'libxrandr', 'at-spi2-core', 'libxdamage', 'libxcursor', 'wayland-protocols', 'libxkbcommon', 'gmp-native', 'mpfr-native', 'libmpc-native', 'zlib-native', 'zstd-native', 'flex-native', 'util-linux', 'libpcre2', 'bash-completion', 'libffi', 'zlib', 'python3', 'cmake-native', 'xorgproto-native', 'util-macros-native', 'fribidi-native', 'harfbuzz-native', 'libxft-native', 'freetype-native', 'libxcb-native', 'libsm-native', 'pixman-native', 'xtrans-native', 'shared-mime-info-native', 'libedit-native', 'util-linux-libuuid-native', 'openssl-native', 'libtirpc-native', 'gdbm-na
 tive', 'bzip2-native', 'sqlite3-native', 'libffi-native', 'libnsl2-native', 'ncurses-native', 'expat-native', 'util-linux-native', 'libpcre2-native', 'dbus-native', 'libxtst-native', 'libxml2-native', 'libxcb', 'xtrans', 'util-macros', 'xorgproto', 'pixman', 'xcb-util', 'perl', 'harfbuzz', 'freetype', 'fribidi', 'libxft', 'perl-native', 'libxkbfile', 'expat', 'libxshmfence', 'vulkan-loader', 'vulkan-headers', 'xrandr', 'libdrm', 'libxxf86vm', 'libxtst', 'dbus', 'xkeyboard-config', 'libxcrypt', 'util-linux-libuuid', 'libcap-ng', 'libpam', 'ncurses', 'bzip2', 'libnsl2', 'libtirpc', 'gdbm', 'xz', 'openssl', 'libedit', 'sqlite3', 'icu-native', 'libpthread-stubs-native', 'xcb-proto-native', 'libxdmcp-native', 'libxau-native', 'libice-native', 'itstool-native', 'libcap-ng-native', 'libxdmcp', 'xcb-proto', 'libpthread-stubs', 'libxau', 'icu', 'make-native', 'libpciaccess', 'update-rc.d', 'initscripts', 'systemd', 'base-passwd', 'shadow-sysroot', 'base-files', 'shadow', 'shadow-native', 'cr
 acklib', 'unzip-native', 'libcap', 'libseccomp', 'kmod', 'zstd', 'acl', 'attr']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/xfce4-xkb-plugin-0.8.3/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/xfce4-xkb-plugin-0.8.3/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
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
| autoreconf: running: intltoolize --copy --force
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/xfce4-xkb-plugin-0.8.3/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/xfce4-xkb-plugin-0.8.3/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/xfce4-xkb-plugin-0.8.3/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:53: installing './compile'
| configure.ac:45: installing './missing'
| panel-plugin/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfce4-xkb-plugin-0.8.3/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot  --disable-static  --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking target system type... x86_64-poky-linux-gnu
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
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot... none
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
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot... (cached) none
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking how to print strings... printf
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot  ) is GNU ld... yes
| checking whether NLS is requested... yes
| checking for intltool >= 0.35.0... 0.51.0 found
| checking for intltool-update... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/intltool-update
| checking for intltool-merge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/intltool-merge
| checking for intltool-extract... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/intltool-extract
| checking for xgettext... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/msgmerge
| checking for msgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/recipe-sysroot-native/usr/bin/msgfmt
| checking for perl... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/perl
| checking for perl >= 5.8.1... 5.26.3
| checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407:286 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407, line 286
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407, line 262
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407, line 232
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407, line 152
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407, line 290
NOTE: recipe xfce4-xkb-plugin-0.8.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3929 tasks of which 3923 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104071803.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104071803.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfce4-xkb-plugin-0.8.3-r0 do_configure: configure failed
ERROR: xfce4-xkb-plugin-0.8.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/run.do_configure.2776407', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-xkb-plugin/0.8.3/temp/log.do_configure.2776407
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.3.bb:do_configure) failed with exit code '1'

--===============2687193738549744930==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-xkb-plugin-upgrade-0.8.2-0.8.3.patch"

RnJvbSA3MDI2NzgwMTIyMmRlZWQ2MzAwZWIxODE2MzUyMTFlZmE5NjljOTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoxODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXhrYi1wbHVnaW46IHVwZ3JhZGUgMC44LjIgLT4gMC44LjMKCi0tLQogLi4uL3t4ZmNlNC14
a2ItcGx1Z2luXzAuOC4yLmJiID0+IHhmY2U0LXhrYi1wbHVnaW5fMC44LjMuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy94a2Ive3hmY2U0LXhrYi1wbHVnaW5fMC44
LjIuYmIgPT4geGZjZTQteGtiLXBsdWdpbl8wLjguMy5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3hrYi94ZmNlNC14a2ItcGx1Z2luXzAuOC4y
LmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMtcGFuZWwtcGx1Z2lucy94a2IveGZjZTQteGtiLXBsdWdp
bl8wLjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVj
aXBlcy1wYW5lbC1wbHVnaW5zL3hrYi94ZmNlNC14a2ItcGx1Z2luXzAuOC4yLmJiCnJlbmFtZSB0
byBtZXRhLXhmY2UvcmVjaXBlcy1wYW5lbC1wbHVnaW5zL3hrYi94ZmNlNC14a2ItcGx1Z2luXzAu
OC4zLmJiCmluZGV4IDNkOTM1YTNkNy4uNzk1ZTRmYzRlIDEwMDY0NAotLS0gYS9tZXRhLXhmY2Uv
cmVjaXBlcy1wYW5lbC1wbHVnaW5zL3hrYi94ZmNlNC14a2ItcGx1Z2luXzAuOC4yLmJiCisrKyBi
L21ldGEteGZjZS9yZWNpcGVzLXBhbmVsLXBsdWdpbnMveGtiL3hmY2U0LXhrYi1wbHVnaW5fMC44
LjMuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTQ5NmYwOWYwODRiMGY3ZTZmMDJmNzY5YTg0NDkwYzZiIgogCiBpbmhlcml0IHhmY2UtcGFu
ZWwtcGx1Z2luCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjRiZTEzZjZmNzNjZDg2YTZkOTM5
ZTFhNmIxMjU4NDFjZjI2NjQxNWJjNGZkMTM0YTUxMWU0ZjBjZjk3OTY3IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImYwYmZlOTc4NzVlZjFjYTBhM2I2YTZmYWMzMTI2NjNjOWNhZGExNTFjZjFhYzk2
MDcxMzkzZDMyMGNkMDQ5ODciCiAKIERFUEVORFMgKz0gImxpYnhrbGF2aWVyIGxpYnduY2szIGxp
YnJzdmcgZ2FyY29uIgogCi0tIAoyLjM5LjIKCg==

--===============2687193738549744930==--

