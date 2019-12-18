Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B68C37FF68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 15:01:30 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n11so754149iom.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 07:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YB/JCNADLETSPJs3wEMDGYoxnmhjRYGo+sOaPCKLxfo=;
	b=Au2J/Kx2B5x5yWGpYedZw0nkHC8wot5y6Q3VWN1ePe+7ny8F1rdSm2vQG6QRwvwYPx
	zz/1Ah2o8DKPRNwzqoqSZSBijTXkVIzrL7UHhpq85KfFvvK8DB4jvC/AHDMXu5Hb642P
	sCWYSNq6TaKfU/iYYBRS6q2gQh5TSty/0oz9KCEhelfKCxIPVNOodyNaZIMbxbmyrssa
	NkTV8upY3eS1/6VujPctzThhgqwCKJz71AArldDdFC4kE2EYUsBZUZQHRXMa1UREjCfS
	RRZ+wOQxOHxvtequd2gUhbbUo6ux2zGHO9owRarPAYcBhq7v/VXjlM+hmUBZNyG1xpHX
	HAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YB/JCNADLETSPJs3wEMDGYoxnmhjRYGo+sOaPCKLxfo=;
	b=Mg2clyumFS5vNVNocj6Z4AON/VY4ARC5RUX1c3D1w6PIsPBHlgDWzhx96qUwVSH6/J
	MJuBlEwuAkjaKH767hq+hCmKit2fr+8kAci75yAuwd/pjM53Bgml+kngX3nE5Y5+xfCb
	/7KkOAlhFttPInDmTW/lEeM/eYY/9UYk3+l5xSLxGRxyYEGJR84Im1sp6HjVQBopFlGj
	vTV1eAuhh+9ip2T7dm8IGvI9bxaZwbhj24+QhcXkTRJut6gcz9ojhp45nxoPPRr9RRTV
	jXdS6iDmib99y1Mr5bUyAek0E+nVrFtWf30w/edcFU2BEhpY8vSverNGPXmPGhIYcEgE
	8EWQ==
X-Gm-Message-State: APjAAAUefRON8Nc7f2DrVtT3pQoCHREIMzZZtGcfeWnn2yCOfyI9fpI0
	RmvskjDF5gLxRQGbECSBcGLOq/P00b1ESbnw6j0=
X-Google-Smtp-Source: APXvYqyDYNv7GqO/0pawbPUo5jr6xgoovAiejOaL5OccrjarIXy3u+V16uxIHkHmH+NEKu4uWwrd/rmOYcAHbuFJ1Yg=
X-Received: by 2002:a5d:87c8:: with SMTP id q8mr2076521ios.108.1576681291573; 
	Wed, 18 Dec 2019 07:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20191218143106.128574-1-alex.kanavin@gmail.com>
	<20191218143106.128574-2-alex.kanavin@gmail.com>
In-Reply-To: <20191218143106.128574-2-alex.kanavin@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 18 Dec 2019 16:01:20 +0100
Message-ID: <CALbNGRTvSNapgjBavAE7S4N0ETWpthMG3XPv=g7_sekCE3vnmw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sysprof: update to 3.34.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 15:01:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 18, 2019 at 3:31 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> 0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> is replaced by a meson option.
>
> Enable all options, as polkit is now available.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...thing-in-help-as-it-requires-itstool.patch | 27 --------------
>  ...-Define-NT_GNU_BUILD_ID-if-undefined.patch | 35 +++++++++++++++++++
>  .../files/define-NT_GNU_BUILD_ID.patch        | 22 ------------
>  .../{sysprof_3.32.0.bb => sysprof_3.34.1.bb}  | 18 ++++++----
>  4 files changed, 46 insertions(+), 56 deletions(-)
>  delete mode 100644 meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
>  create mode 100644 meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>  delete mode 100644 meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
>  rename meta-oe/recipes-kernel/sysprof/{sysprof_3.32.0.bb => sysprof_3.34.1.bb} (54%)
>
> diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> deleted file mode 100644
> index ade51cf86..000000000
> --- a/meta-oe/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 23 Aug 2017 18:38:26 +0300
> -Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - meson.build | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 3986273..ae2f65e 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -164,7 +164,6 @@ subdir('tools')
> - subdir('tests')
> -
> - subdir('data')
> --subdir('help')
> - subdir('po')
> -
> - meson.add_install_script('build-aux/meson/post_install.sh')
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch b/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> new file mode 100644
> index 000000000..75aa86cdb
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> @@ -0,0 +1,35 @@
> +From 3025d80aaacc5f67aa9eb1e6fde30f71d9c5b04b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 18 Jul 2011 16:00:17 -0700
> +Subject: [PATCH 1/2] sysprof: Define NT_GNU_BUILD_ID if undefined
> +
> +On uclibc elf.h does not have GNU extentions but we need this define
> +so we define it locally if its not getting it from elf.h
uclibc is long gone. Is this stlll necessary for musl?
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +%% original patch: define-NT_GNU_BUILD_ID.patch
> +---
> + src/libsysprof/elfparser.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/libsysprof/elfparser.h b/src/libsysprof/elfparser.h
> +index 160e4c9..94fa5c0 100644
> +--- a/src/libsysprof/elfparser.h
> ++++ b/src/libsysprof/elfparser.h
> +@@ -18,6 +18,10 @@
> +
> + #include <glib.h>
> +
> ++#ifndef NT_GNU_BUILD_ID
> ++#define NT_GNU_BUILD_ID 3
> ++#endif
> ++
> + typedef struct ElfSym ElfSym;
> + typedef struct ElfParser ElfParser;
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> deleted file mode 100644
> index f75ddad43..000000000
> --- a/meta-oe/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -On uclibc elf.h does not have GNU extentions but we need this define
> -so we define it locally if its not getting it from elf.h
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -Index: git/elfparser.h
> -===================================================================
> ---- git.orig/lib/util/elfparser.h      2011-07-16 18:57:41.000000000 -0700
> -+++ git/lib/util/elfparser.h   2011-07-16 20:28:54.733829895 -0700
> -@@ -17,6 +17,10 @@
> -  */
> - #include <glib.h>
> -
> -+#ifndef NT_GNU_BUILD_ID
> -+#define NT_GNU_BUILD_ID 3
> -+#endif
> -+
> - typedef struct ElfSym ElfSym;
> - typedef struct ElfParser ElfParser;
> -
> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> similarity index 54%
> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
> rename to meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> index b92933806..b7e7bee6b 100644
> --- a/meta-oe/recipes-kernel/sysprof/sysprof_3.32.0.bb
> +++ b/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> @@ -2,23 +2,26 @@ SUMMARY = "System-wide Performance Profiler for Linux"
>  HOMEPAGE = "http://www.sysprof.com"
>  LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
> +                    file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
>
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gettext systemd upstream-version-is-even gsettings
>
>  DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
>
> -SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
> -SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
> +SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
> +SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
>  SRC_URI += " \
> -           file://define-NT_GNU_BUILD_ID.patch \
> -           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
> +           file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
>             "
>
> -PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> -PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
> +PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> +PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
>  PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
> +PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
> +
> +# Enablig this requries yelp
> +EXTRA_OEMESON += "-Dhelp=false -Dsystemdunitdir=${systemd_unitdir}"
No blocker - I'll take care later - we can build help these days (with
meta-gnome - see below)
>
>  SOLIBS = ".so"
>  FILES_SOLIBSDEV = ""
> @@ -28,5 +31,6 @@ SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysp
>  FILES_${PN} += " \
>                 ${datadir}/dbus-1/system-services \
>                 ${datadir}/dbus-1/system.d \
> +               ${datadir}/dbus-1/interfaces \
>                 ${datadir}/metainfo \
>                 "
> --
> 2.17.1
>
Maybe I missed something but the only (optional) dependency left is
mutter. Shouldn't sysprof go into meta-gnome?

Andreas

