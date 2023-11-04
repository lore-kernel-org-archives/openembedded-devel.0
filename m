Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5D2C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4238.1699071647877827950
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vu9kYnNq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d7ZOGAsF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b988fde68-3c5989a3-a189-4fa3-90b1-17328a02da23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z3DgWSOXUlXqvy5lFpZeXSLhfvbs2WZlG4Rvhy+AjLw=;
	b=Vu9kYnNqhR+vAWRab5hphPzHPFVFvsSzfWjrv0ly59FLxC6ZdFlWUUZUS3wPLBWJ
	VUALr2fD+MNmAX6HtukPjZv1UQOhR5+fIAZGofyoPAN9D504ghV4gGDfyPtZtxvCnTo
	vpXvluqZmvqKLICnVZtrcAuuSUOTpURm0QjNyaC0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z3DgWSOXUlXqvy5lFpZeXSLhfvbs2WZlG4Rvhy+AjLw=;
	b=d7ZOGAsFmAjNvKw6ThfHPnRfMBs1YzOqI7Z/1QQuDsEEQ6qQY6lNg8BgQ7V6Ixbp
	CrL+yJTzrq0r7/Cr92nKB5wivZ591N7Ghca+XZxg1WsY4OxeJOHTJnxioOCPfDl4xvz
	qFDLfCFVAUXR3Fa/Sjkal5Gzm53CvCjAf7q5bsDc=
Content-Type: multipart/mixed; boundary="===============7874200956304279749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] rygel: upgrading to 0.42.4 FAILED
Message-ID: <0101018b988fde68-3c5989a3-a189-4fa3-90b1-17328a02da23-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106267

--===============7874200956304279749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rygel* to *0.42.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rygel-upgrade-0.40.4-0.42.4.patch
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
From fd3ed54f84dbd4528c06481453c89c56812209ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Nov 2023 04:09:44 +0000
Subject: [PATCH] rygel: upgrade 0.40.4 -> 0.42.4

---
 .../rygel/{rygel_0.40.4.bb => rygel_0.42.4.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.40.4.bb => rygel_0.42.4.bb} (97%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
similarity index 97%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
index 8bc8767d8..d0bd7dd91 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
@@ -20,7 +20,7 @@ inherit gnomebase features_check vala gobject-introspection gettext systemd meso
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "736d8adbe8615f6cbc8fcfff9845dc985fd10e16629da236b4b52dbedf0a348b"
+SRC_URI[archive.sha256sum] = "6310dfaa2d332b66119b9b020fad6a4bd27d9bc61faf780ca5ca0b62813303f7"
 
 GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.39.2


--===============7874200956304279749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4915 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:bb68edd894d68132efe67458da5ae82f36550133"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 649 Local 640 Mirrors 0 Missed 9 Current 657 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 1306 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 676 of 1306 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rygel-0.42.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe rygel-0.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rygel-0.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rygel-0.42.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 1306 of 1306 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe rygel-0.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rygel-0.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3247 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_fetch)
NOTE: Running task 3390 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_write_config)
NOTE: recipe rygel-0.42.4-r0: task do_fetch: Started
NOTE: recipe rygel-0.42.4-r0: task do_write_config: Started
NOTE: recipe rygel-0.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 3495 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_unpack)
NOTE: Running task 3496 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe rygel-0.42.4-r0: task do_write_config: Succeeded
NOTE: recipe rygel-0.42.4-r0: task do_unpack: Started
NOTE: recipe rygel-0.42.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rygel-0.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 3497 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_patch)
NOTE: Running task 3498 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_collect_spdx_deps)
NOTE: recipe rygel-0.42.4-r0: task do_patch: Started
NOTE: recipe rygel-0.42.4-r0: task do_patch: Succeeded
NOTE: recipe rygel-0.42.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe rygel-0.42.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3501 of 3513 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_configure)
NOTE: recipe rygel-0.42.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rygel-0.42.4-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build
 /meta-openembedded/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_
 2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libsoup/libsoup-2.4_2.74.3
 .bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/reci
 pes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gssdp', 'gupnp-av', 'gupnp-dlna', 'gupnp', 'libmediaart-2.0', 'gst-editing-services', 'libgee', 'glib-2.0', 'glibc', 'libxml2', 'systemd-systemctl-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'qemu-native', 'quilt-native', 'vala', 'gobject-introspection', 'gtk+3', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libsoup-2.4', 'libunistring', 'sqlite3', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'vala-native', 'xz-native', 'gobject-introspection-native', 'gtk4', 'zlib', 'python3', 'opkg-utils', 'libffi', 'util-linux', 'libjpeg-turbo', 'orc', 'libsm', 'libxv', 'wayland', 'iso-codes', 'libdrm', 'libx11', 'wayland-protocols', 'libogg', 'alsa-lib', 'libglu', 'libxrender', 'libpng', 'pango', 'libvorbis', 'mesa', 'libtheora', 'texinfo-dummy-native', 'mpfr-native', 'gmp-native', '
 zlib-native', 'binutils-cross-x86_64', 'gnu-config-native', 'linux-libc-headers', 'zstd-native', 'libmpc-native', 'flex-native', 'libffi-native', 'gdbm-native', 'bzip2-native', 'ncurses-native', 'libtirpc-native', 'openssl-native', 'libedit-native', 'sqlite3-native', 'expat-native', 'libnsl2-native', 'util-linux-libuuid-native', 'libpsl', 'gettext-minimal-native', 'libpcre2', 'bash-completion', 'e2fsprogs', 'm4-native', 'libxml-parser-perl-native', 're2c-native', 'libxdamage', 'libxcursor', 'fontconfig', 'libxcomposite', 'libxi', 'libxext', 'gdk-pixbuf', 'libepoxy', 'at-spi2-core', 'libxfixes', 'libxrandr', 'libxkbcommon', 'cairo', 'libgcc', 'python3-pygobject', 'gstreamer1.0-plugins-bad', 'python3-installer-native', 'python3-setuptools-native', 'python3-build-native', 'python3-wheel-native', 'glib-2.0-native', 'attr-native', 'librsvg', 'vulkan-loader', 'vulkan-headers', 'libxinerama', 'tiff', 'graphene', 'harfbuzz', 'gi-docgen', 'fribidi', 'util-linux-libuuid', 'libnsl2', 'gdbm', '
 xz', 'libxcrypt', 'expat', 'libtirpc', 'bzip2', 'ncurses', 'openssl', 'libedit', 'libcap-ng', 'libpam', 'libice', 'xorgproto', 'util-macros', 'xtrans', 'libpthread-stubs', 'libpciaccess', 'libxcb', 'libxft', 'freetype', 'libxxf86vm', 'libxshmfence', 'xrandr', 'perl-native', 'cmake-native', 'icu', 'attr', 'shared-mime-info', 'libxtst', 'dbus', 'xkeyboard-config', 'pixman', 'python3-pycairo', 'libgudev', 'libusb1', 'bluez5', 'libsndfile1', 'libwebp', 'curl', 'sbc', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'libpcre2-native', 'util-linux-native', 'libstd-rs', 'cracklib', 'xcb-proto', 'libxau', 'libxdmcp', 'make-native', 'shadow', 'base-files', 'systemd', 'initscripts', 'shadow-sysroot', 'shadow-native', 'update-rc.d', 'base-passwd', 'readline', 'libical', 'flac', 'libidn2', 'unzip-native', 'libcap-ng-native', 'libseccomp', 'kmod', 'acl', 'zstd', 'libcap']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dengines=gstreamer -Dplugins=external,mpris,ruih,gst-launch,media-export ...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/rygel-0.42.4
| Build dir: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/build
| Build type: cross build
| Project name: rygel
| Project version: 0.42.4
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/recipe-sysroot ld.bfd 2.41.0.20230926
| Vala compiler for the host machine: valac (valac 0.56.13)
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Vala compiler for the build machine: valac (valac 0.56.13)
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Program build-aux/meson/install-gtkdoc.py found: YES (/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/recipe-sysroot-native/usr/bin/nativepython3 /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/rygel-0.42.4/build-aux/meson/install-gtkdoc.py)
| Program valadoc found: NO
| Found pkg-config: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Found CMake: NO
| Run-time dependency gtk-doc found: NO (tried pkgconfig and cmake)
| Run-time dependency gupnp-1.6 found: NO (tried pkgconfig)
| 
| ../rygel-0.42.4/meson.build:79:8: ERROR: Dependency "gupnp-1.6" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/run.do_configure.1267665:191 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/run.do_configure.1267665, line 191
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/run.do_configure.1267665, line 180
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/run.do_configure.1267665, line 166
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/run.do_configure.1267665, line 204
NOTE: recipe rygel-0.42.4-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3501 tasks of which 3494 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104040921.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104040921.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: rygel-0.42.4-r0 do_configure: meson failed
ERROR: rygel-0.42.4-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/run.do_configure.1267665', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/rygel/0.42.4/temp/log.do_configure.1267665
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb:do_configure) failed with exit code '1'

--===============7874200956304279749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rygel-upgrade-0.40.4-0.42.4.patch"

RnJvbSBmZDNlZDU0Zjg0ZGJkNDUyOGMwNjQ4MTQ1M2M4OWM1NjgxMjIwOWVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNDowOTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ5
Z2VsOiB1cGdyYWRlIDAuNDAuNCAtPiAwLjQyLjQKCi0tLQogLi4uL3J5Z2VsL3tyeWdlbF8wLjQw
LjQuYmIgPT4gcnlnZWxfMC40Mi40LmJifSAgICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS1tdWx0
aW1lZGlhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3J5Z2VsL3tyeWdlbF8wLjQwLjQuYmIgPT4gcnln
ZWxfMC40Mi40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9yeWdlbC9yeWdlbF8wLjQwLjQuYmIgYi9tZXRhLW11bHRpbWVkaWEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvcnlnZWwvcnlnZWxfMC40Mi40LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yeWdl
bC9yeWdlbF8wLjQwLjQuYmIKcmVuYW1lIHRvIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9yeWdlbC9yeWdlbF8wLjQyLjQuYmIKaW5kZXggOGJjODc2N2Q4Li5kMGJkN2RkOTEg
MTAwNjQ0Ci0tLSBhL21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yeWdlbC9y
eWdlbF8wLjQwLjQuYmIKKysrIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3J5Z2VsL3J5Z2VsXzAuNDIuNC5iYgpAQCAtMjAsNyArMjAsNyBAQCBpbmhlcml0IGdub21lYmFz
ZSBmZWF0dXJlc19jaGVjayB2YWxhIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnZXR0ZXh0IHN5c3Rl
bWQgbWVzbwogIyBnb2JqZWN0LWludHJvc3BlY3Rpb24gaXMgbWFuZGF0b3J5IGZvciBsaWJtZWRp
YWFydC0yLjAgYW5kIGNhbm5vdCBiZSBjb25maWd1cmVkCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVS
RVMgPSAiZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjczNmQ4YWRiZTg2MTVmNmNiYzhmY2ZmZjk4NDVkYzk4NWZkMTBlMTY2MjlkYTIz
NmI0YjUyZGJlZGYwYTM0OGIiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI2MzEwZGZh
YTJkMzMyYjY2MTE5YjliMDIwZmFkNmE0YmQyN2Q5YmM2MWZhZjc4MGNhNWNhMGI2MjgxMzMwM2Y3
IgogCiBHTk9NRUJBU0VCVUlMRENMQVNTID0gIm1lc29uIgogR0lSX01FU09OX0VOQUJMRV9GTEFH
ID0gJ2VuYWJsZWQnCi0tIAoyLjM5LjIKCg==

--===============7874200956304279749==--

