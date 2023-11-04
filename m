Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7EAC05032
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5537.1699083061392721782
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GyLTnL8x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OvxPiGtj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b993e05cc-db9adf3d-a288-4df4-8fbf-bedaa91867a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u+RN8RBBR29ILX9yHdhhz0F3em6jdPKSEiYDJveYyas=;
	b=GyLTnL8xWLfoHGe0PmLLPStF22pY8uZEq4FUT/6zf/tOCjki0b1G12DsXdcpFxW3
	UhHrwGrSD7SCu0maa43uKyrHocFXudyV/NcUAY0wO324CoiI6ba3L1c6TD9nPxI9WgF
	XNJitUne5I5JMJdV2nJtr8dCLmUDpFIwO9DgfXXQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u+RN8RBBR29ILX9yHdhhz0F3em6jdPKSEiYDJveYyas=;
	b=OvxPiGtjxj20aL6PSzCE6bi6upE7/cNdUPm+wQXbXO9Lh8so1HM+QUpmMVlpJp8k
	jcTwcg4sR6AvtVw8pdwGgCQGEkEw29hd9l7iDU1sVHp9H5i3FkHn9EJ+VhmOhH30Eq+
	xEY9xGXxHPym3mEFzX/Ir1sLD4HrNjOIC3iA71Fs=
Content-Type: multipart/mixed; boundary="===============1900466143932216017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfconf: upgrading to 4.19.1 FAILED
Message-ID: <0101018b993e05cc-db9adf3d-a288-4df4-8fbf-bedaa91867a6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106347

--===============1900466143932216017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xfconf* to *4.19.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xfconf-upgrade-4.18.0-4.19.1.patch
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
From c5a78537db8d59e481c6a883b6437ec91d7e648f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 07:20:39 +0000
Subject: [PATCH] xfconf: upgrade 4.18.0 -> 4.19.1

---
 .../recipes-xfce/xfconf/{xfconf_4.18.0.bb => xfconf_4.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.18.0.bb => xfconf_4.19.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb
index f5c598b8d..d2be8d242 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completion vala
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[sha256sum] = "2e8c50160bf800a807aea094fc9dad81f9f361f42db56607508ed5b4855d2906"
+SRC_URI[sha256sum] = "2cd2396f473d336fb770d423c8b6bfd5095c279028f19691de49b42e43537190"
 
 FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.39.2


--===============1900466143932216017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4977 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:915233cab765dc3b7b5d6f2ccf5d211a3a6274f7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 548 Local 539 Mirrors 0 Missed 9 Current 600 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 611 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 613 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 838 of 1148 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 839 of 1148 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfconf-4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xfconf-4.19.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfconf-4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xfconf-4.19.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 1055 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1097 of 1148 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe xfce4-dev-tools-native-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfconf-4.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1148 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfconf-4.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-dev-tools-native-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xfce4-dev-tools-native-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2877 of 3163 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_fetch)
NOTE: recipe xfconf-4.19.1-r0: task do_fetch: Started
NOTE: recipe xfconf-4.19.1-r0: task do_fetch: Succeeded
NOTE: Running task 3145 of 3163 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_unpack)
NOTE: Running task 3146 of 3163 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xfconf-4.19.1-r0: task do_unpack: Started
NOTE: recipe xfconf-4.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfconf-4.19.1-r0: task do_unpack: Succeeded
NOTE: Running task 3147 of 3163 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_patch)
NOTE: Running task 3148 of 3163 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_collect_spdx_deps)
NOTE: recipe xfconf-4.19.1-r0: task do_patch: Started
NOTE: recipe xfconf-4.19.1-r0: task do_patch: Succeeded
NOTE: recipe xfconf-4.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfconf-4.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfconf-4.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3151 of 3163 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_configure)
NOTE: recipe xfconf-4.19.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/h
 ome/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-
 dev-tools_4.18.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yo
 cto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libxfce4util', 'glibc', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'perl', 'qemu-native', 'quilt-native', 'vala', 'gdk-pixbuf', 'gobject-introspection', 'gtk+3', 'hicolor-icon-theme', 'bash-completion', 'xfce4-dev-tools-native', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'vala-native', 'gobject-introspection-native', 'gtk+3-native', 'gtk-doc-native', 'zlib-native', 'xz-native', 'libffi-native', 'glib-2.0-native', 'flex-native', 'at-spi2-core', 'libxcomposite', 'libxrender', 'libxdamage', 'libxfixes', 'libxcursor', 'libx11', 'mesa', 'wayland', 'fontconfig', 'cairo', 'opkg-utils', 'libxext', 'libpng', 'glib-2.0', 'libxrandr', 'wayland-protocols', 'libepoxy', 'libjpeg-turbo', 'pango', 'libxkbcommon', 'libxi', 'libxml-parser-perl-native', 'zlib', 'gdbm', 'libxcrypt', 'texinfo-dummy-native', 'binutils-cross-x86_6
 4', 'attr-native', 'linux-libc-headers', 'libgcc', 'm4-native', 'gnu-config-native', 'python3', 'libffi', 'libmpc-native', 'zstd-native', 'mpfr-native', 'gmp-native', 'gettext-minimal-native', 'shared-mime-info', 'fontconfig-native', 'pango-native', 'libx11-native', 'cairo-native', 'libxrandr-native', 'libxfixes-native', 'libxrender-native', 'libxcursor-native', 'libjpeg-turbo-native', 'at-spi2-core-native', 'libpng-native', 'gdk-pixbuf-native', 'libxdamage-native', 'libxi-native', 'libxcomposite-native', 'libxext-native', 'libnsl2-native', 'bzip2-native', 'expat-native', 'sqlite3-native', 'gdbm-native', 'libedit-native', 'libtirpc-native', 'ncurses-native', 'openssl-native', 'util-linux-libuuid-native', 'libpcre2-native', 'util-linux-native', 'libxml2', 'libxtst', 'dbus', 'xorgproto', 'util-macros', 'xtrans', 'libxcb', 'libdrm', 'vulkan-loader', 'libxxf86vm', 'xrandr', 'expat', 'vulkan-headers', 'libxshmfence', 'util-linux', 'freetype', 'pixman', 'libsm', 'libpcre2', 'libxft', 'fri
 bidi', 'harfbuzz', 'xkeyboard-config', 'perl-native', 'libedit', 'sqlite3', 'util-linux-libuuid', 'libtirpc', 'openssl', 'bzip2', 'libnsl2', 'ncurses', 'xz', 'freetype-native', 'fribidi-native', 'harfbuzz-native', 'libxft-native', 'xtrans-native', 'libxcb-native', 'util-macros-native', 'xorgproto-native', 'libsm-native', 'pixman-native', 'cmake-native', 'libxml2-native', 'dbus-native', 'libxtst-native', 'shared-mime-info-native', 'libcap-ng-native', 'update-rc.d', 'shadow-native', 'shadow', 'systemd', 'base-passwd', 'shadow-sysroot', 'initscripts', 'base-files', 'xcb-proto', 'libxau', 'libpthread-stubs', 'libxdmcp', 'libpciaccess', 'libpam', 'libcap-ng', 'libice', 'icu', 'make-native', 'icu-native', 'libxau-native', 'libpthread-stubs-native', 'xcb-proto-native', 'libxdmcp-native', 'libice-native', 'itstool-native', 'attr', 'zstd', 'libcap', 'acl', 'libseccomp', 'kmod', 'cracklib', 'unzip-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/xfconf-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/xfconf-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/xfconf-4.19.1/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/xfconf-4.19.1/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/xfconf-4.19.1/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:41: installing './compile'
| configure.ac:26: installing './missing'
| common/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfconf-4.19.1/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot --enable-introspection --disable-gtk-doc  PERL=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot/usr/bin/perl --disable-static  --disable-gsettings-backend --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
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
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot... none
| checking whether make sets $(MAKE)... (cached) yes
| checking whether ln -s works... yes
| checking for a sed that does not truncate output... (cached) sed
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for errno.h... yes
| checking for fcntl.h... yes
| checking for grp.h... yes
| checking for locale.h... yes
| checking for signal.h... yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/time.h... yes
| checking for sys/types.h... (cached) yes
| checking for sys/wait.h... yes
| checking for unistd.h... (cached) yes
| checking for fdatasync... yes
| checking for fsync... yes
| checking for setlocale... yes
| checking whether NLS is requested... yes
| checking for msgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot-native/usr/bin/msgmerge
| checking for ld... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot   -m elf_x86_64
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot   -m elf_x86_64) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... no
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/recipe-sysroot  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for egrep -e... (cached) /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib,lib64
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyCurrent... no
| checking for GNU gettext in libc... yes
| checking whether to use NLS... yes
| checking where the gettext function comes from... libc
| ../xfconf-4.19.1/configure: line 16531: syntax error near unexpected token `GDBUS_CODEGEN,'
| ../xfconf-4.19.1/configure: line 16531: `XDT_CHECK_PACKAGE_BINARY(GDBUS_CODEGEN, gio-2.0, gdbus_codegen, gdbus-codegen)'
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150:303 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150, line 303
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150, line 279
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150, line 249
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150, line 169
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150, line 307
NOTE: recipe xfconf-4.19.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3151 tasks of which 3145 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104072008.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104072008.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfconf-4.19.1-r0 do_configure: configure failed
ERROR: xfconf-4.19.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/run.do_configure.2787150', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfconf/4.19.1/temp/log.do_configure.2787150
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfconf/xfconf_4.19.1.bb:do_configure) failed with exit code '1'

--===============1900466143932216017==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfconf-upgrade-4.18.0-4.19.1.patch"

RnJvbSBjNWE3ODUzN2RiOGQ1OWU0ODFjNmE4ODNiNjQzN2VjOTFkN2U2NDhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNzoyMDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y29uZjogdXBncmFkZSA0LjE4LjAgLT4gNC4xOS4xCgotLS0KIC4uLi9yZWNpcGVzLXhmY2UveGZj
b25mL3t4ZmNvbmZfNC4xOC4wLmJiID0+IHhmY29uZl80LjE5LjEuYmJ9ICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEteGZj
ZS9yZWNpcGVzLXhmY2UveGZjb25mL3t4ZmNvbmZfNC4xOC4wLmJiID0+IHhmY29uZl80LjE5LjEu
YmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNvbmYveGZj
b25mXzQuMTguMC5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjb25mL3hmY29uZl80LjE5
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMt
eGZjZS94ZmNvbmYveGZjb25mXzQuMTguMC5iYgpyZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMt
eGZjZS94ZmNvbmYveGZjb25mXzQuMTkuMS5iYgppbmRleCBmNWM1OThiOGQuLmQyYmU4ZDI0MiAx
MDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNvbmYveGZjb25mXzQuMTguMC5i
YgorKysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY29uZi94ZmNvbmZfNC4xOS4xLmJiCkBA
IC04LDcgKzgsNyBAQCBpbmhlcml0IHhmY2UgZ3RrLWRvYyBnb2JqZWN0LWludHJvc3BlY3Rpb24g
YmFzaC1jb21wbGV0aW9uIHZhbGEKIAogRVhUUkFfT0VDT05GICs9ICJQRVJMPSR7U1RBR0lOR19E
SVJfVEFSR0VUfS91c3IvYmluL3BlcmwiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZThjNTAx
NjBiZjgwMGE4MDdhZWEwOTRmYzlkYWQ4MWY5ZjM2MWY0MmRiNTY2MDc1MDhlZDViNDg1NWQyOTA2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJjZDIzOTZmNDczZDMzNmZiNzcwZDQyM2M4YjZiZmQ1
MDk1YzI3OTAyOGYxOTY5MWRlNDliNDJlNDM1MzcxOTAiCiAKIEZJTEVTOiR7UE59ICs9ICIke2xp
YmRpcn0veGZjZTQveGZjb25mL3hmY29uZmQgXAogICAgICAgICAgICAgICAgICR7bGliZGlyfS9n
aW8vbW9kdWxlcy9saWJ4ZmNvbmZnc2V0dGluZ3NiYWNrZW5kLnNvIFwKLS0gCjIuMzkuMgoK

--===============1900466143932216017==--

