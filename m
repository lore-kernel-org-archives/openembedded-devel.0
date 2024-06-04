Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD76C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 19:06:33 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.4466.1717527986501832795
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 12:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 454J6JKQ029024;
	Tue, 4 Jun 2024 14:06:20 -0500
Received: from [192.168.3.156] ([192.168.3.156])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 454J6JVN021804;
	Tue, 4 Jun 2024 14:06:19 -0500
Message-ID: <05d8f051-111b-4bd0-a4d9-981ac9d6db2d@kernel.crashing.org>
Date: Tue, 4 Jun 2024 14:06:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2] v4l-utils: Update to 1.26.1
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20240112125553.263105-1-festevam@gmail.com>
Cc: Mark Hatle <mark.hatle@amd.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240112125553.263105-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 19:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110688

I know this is months old, but I recently found an issue with this.  Below the 
patch that ensured that 'metactl' headers were exported was removed.  This new 
version no longer exports the headers required by components like gstreamer to 
use the 'mediactrl' interface exported by libv4l.

I'm not sure how to fix it at this point, but I wanted to report the issue.

--Mark

On 1/12/24 6:55 AM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Update to 1.26.1.
> 
> Remove the Makefile.am patches as they no longer apply due to
> the switch to Meson.
> 
> Backport a fix that prevents installing 50-rc_keymap.conf in systems
> without systemd.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Adjust SRCREV to point to the v4l-utils-1.26.1 tag insted of stable-1.26.
> - Keep udevdir v4l2-compliance-32 and v4l2-ctl-32 options.
> - Apply a backport fix.
> 
>   ...-Don-t-install-libmediactl-and-libv4.patch | 46 ------------------
>   ...estrict-the-installation-of-50-rc_ke.patch | 47 +++++++++++++++++++
>   ...02-original-patch-mediactl-pkgconfig.patch | 23 ---------
>   ...iginal-patch-export-mediactl-headers.patch | 26 ----------
>   ...4l-utils_1.24.1.bb => v4l-utils_1.26.1.bb} | 28 +++++------
>   5 files changed, 59 insertions(+), 111 deletions(-)
>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>   create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
>   rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.24.1.bb => v4l-utils_1.26.1.bb} (77%)
> 
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
> deleted file mode 100644
> index 52f0cd338..000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 0d5c0e9a75eca43667b0e29155b635e50622b66a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 27 Feb 2015 21:55:36 +0000
> -Subject: [PATCH] Revert "media-ctl: Don't install libmediactl and
> -
> - libv4l2subdev"
> -
> -This reverts commit 0911dce53b08b0df3066be2c75f67e8a314d8729.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Conflicts:
> -	utils/media-ctl/Makefile.am
> -
> ----
> -Upstream-Status: Pending
> -
> - utils/media-ctl/Makefile.am | 10 +++-------
> - 1 file changed, 3 insertions(+), 7 deletions(-)
> -
> -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> -index c48c8d6..e255e16 100644
> ---- a/utils/media-ctl/Makefile.am
> -+++ b/utils/media-ctl/Makefile.am
> -@@ -1,8 +1,7 @@
> --noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
> --
> -+lib_LTLIBRARIES = libmediactl.la libv4l2subdev.la
> - libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
> --libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
> --libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
> -+libmediactl_la_CFLAGS = $(LIBUDEV_CFLAGS)
> -+libmediactl_la_LDFLAGS = $(LIBUDEV_LIBS)
> -
> - media-bus-format-names.h: ../../include/linux/media-bus-format.h
> - 	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
> -@@ -18,9 +17,6 @@ CLEANFILES = $(BUILT_SOURCES)
> - nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
> - libv4l2subdev_la_SOURCES = libv4l2subdev.c
> - libv4l2subdev_la_LIBADD = libmediactl.la
> --libv4l2subdev_la_CFLAGS = -static
> --libv4l2subdev_la_LDFLAGS = -static
> --
> - mediactl_includedir=$(includedir)/mediactl
> - noinst_HEADERS = mediactl.h v4l2subdev.h
> -
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
> new file mode 100644
> index 000000000..6d06d826b
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch
> @@ -0,0 +1,46 @@
> +From 502c0302827cec3d2b2a69fb25189646685ef2ff Mon Sep 17 00:00:00 2001
> +From: Fabio Estevam <festevam@denx.de>
> +Date: Fri, 12 Jan 2024 00:17:14 -0300
> +Subject: [PATCH] keytable: meson: Restrict the installation of
> + 50-rc_keymap.conf
> +
> +Currently, meson tries to install 50-rc_keymap.conf even if systemd
> +is not used.
> +
> +Commit 01f2c6c58e6f ("keytable: restrict installation of 50-rc_keymap.conf"),
> +only allowed 50-rc_keymap.conf to be installed when both BPF and systemd
> +were used.
> +
> +Apply the same logic in meson to fix the problem.
> +
> +Signed-off-by: Fabio Estevam <festevam@denx.de>
> +Signed-off-by: Sean Young <sean@mess.org>
> +Upstream-Status: Backport [https://git.linuxtv.org/v4l-utils.git/commit/?id=a21924ec424c4744af6f2a794e0677eba35dd168]
> +---
> + utils/keytable/meson.build | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
> +index 4130a4bea514..76ce329eae8e 100644
> +--- a/utils/keytable/meson.build
> ++++ b/utils/keytable/meson.build
> +@@ -69,6 +69,8 @@ ir_keytable_udev_rules = files(
> + install_data(ir_keytable_udev_rules,
> +              install_dir : ir_keytable_system_dir / 'rules.d')
> +
> ++if ir_bpf_enabled
> ++if dep_systemd.found()
> + if have_udevdsyscallfilter
> +     ir_keytable_systemd_files = files(
> +         '50-rc_keymap.conf',
> +@@ -76,6 +78,8 @@ if have_udevdsyscallfilter
> +     install_data(ir_keytable_systemd_files,
> +                  install_dir : systemd_systemdir / 'systemd-udevd.service.d')
> + endif
> ++endif
> ++endif
> +
> + # Install non-existing directory to create empty directory structure
> + # See: https://github.com/mesonbuild/meson/issues/2904
> +--
> +2.34.1
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
> deleted file mode 100644
> index d52475974..000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 320b8378ee30eb5e0fe83a8b397f822f2f88a4c1 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 1 Mar 2015 22:25:07 +0000
> -Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
> -
> ----
> -Upstream-Status: Pending
> -
> - utils/media-ctl/Makefile.am | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> -index e255e16..ff7b417 100644
> ---- a/utils/media-ctl/Makefile.am
> -+++ b/utils/media-ctl/Makefile.am
> -@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD = libmediactl.la
> - mediactl_includedir=$(includedir)/mediactl
> - noinst_HEADERS = mediactl.h v4l2subdev.h
> -
> -+pkgconfig_DATA = libmediactl.pc
> - bin_PROGRAMS = media-ctl
> - media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
> - media_ctl_LDADD = libmediactl.la libv4l2subdev.la
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
> deleted file mode 100644
> index f6fcee92e..000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From f7109d6b2fcb291824d795071c04a492d9fbc45b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 1 Mar 2015 22:25:07 +0000
> -Subject: [PATCH] %% original patch: export-mediactl-headers.patch
> -
> ----
> -Upstream-Status: Pending
> -
> - utils/media-ctl/Makefile.am | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
> -index ff7b417..6ce656f 100644
> ---- a/utils/media-ctl/Makefile.am
> -+++ b/utils/media-ctl/Makefile.am
> -@@ -17,8 +17,8 @@ CLEANFILES = $(BUILT_SOURCES)
> - nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
> - libv4l2subdev_la_SOURCES = libv4l2subdev.c
> - libv4l2subdev_la_LIBADD = libmediactl.la
> --mediactl_includedir=$(includedir)/mediactl
> --noinst_HEADERS = mediactl.h v4l2subdev.h
> -+otherincludedir = $(includedir)/mediactl
> -+otherinclude_HEADERS = mediactl.h v4l2subdev.h
> -
> - pkgconfig_DATA = libmediactl.pc
> - bin_PROGRAMS = media-ctl
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> similarity index 77%
> rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
> rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> index f314d9b6a..4ae1a18c9 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> @@ -18,34 +18,30 @@ LDFLAGS:append = " -pthread"
>   # Needs further investigation
>   GLIBC_64BIT_TIME_FLAGS = ""
>   
> -inherit autotools gettext pkgconfig
> +inherit meson gettext pkgconfig
>   
> -PACKAGECONFIG ??= "media-ctl"
> -PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
> -PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
> -PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
> -PACKAGECONFIG[v4l2-tracer] = ",--disable-v4l2-tracer,json-c"
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[qv4l2] = ",-Dqv4l2=disabled"
> +PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
> +PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
>   
>   SRC_URI = "\
> -    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.24 \
> -    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
> -    file://0002-original-patch-mediactl-pkgconfig.patch \
> -    file://0003-original-patch-export-mediactl-headers.patch \
> +    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.26 \
> +    file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
>       file://0004-Do-not-use-getsubopt.patch \
>   "
>   
> -SRCREV = "8799081b143627c9c09dea0c60ad3d1cc17cc848"
> +SRCREV = "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
>   
>   PV .= "+git${SRCPV}"
>   
>   S = "${WORKDIR}/git"
>   
> -do_configure:prepend() {
> -    cd ${S}; ./bootstrap.sh; cd -
> -}
> +EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
>   
> -EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
> -                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
> +# Disable the erroneous installation of gconv-modules that would break glib
> +# like it is done in Debian and ArchLinux.
> +EXTRA_OEMESON += "-Dgconv=disabled"
>   
>   VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108240): https://lists.openembedded.org/g/openembedded-devel/message/108240
> Mute This Topic: https://lists.openembedded.org/mt/103681772/3616948
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

