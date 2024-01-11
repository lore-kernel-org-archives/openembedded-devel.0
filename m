Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269EAC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 20:10:17 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.2656.1705003811129071736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 12:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exO6taR6;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2041c292da8so3102702fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 12:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003810; x=1705608610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nroJZiC7AhrV4xd5yaNbEFGd0fEvlZ1Aoag8XOO3VnI=;
        b=exO6taR6ptnY5ut7SF2AJ/VSYIZKxt3JY02x0dFiN955t9QTV7m/0jjY2F8z8dE/k2
         xugDA61/4mu24cG06pjyIpv7ZkTRsQSgOuUN3veUi6jGyvGiff9YkLpbrXwFEEC0LIZC
         34T/zF2AO0DR3saVwpoJIOo7cTJP5ELGYTqLWpz9C60CU1bW/Coa7MmbdCvmcRsUuhNl
         aWl0NU3UujypWwRmrtDwus7NilBh4j6A98CrqqwpMjHiFOlkl6Yb6Zx4SQfDerW5Bbhy
         yyq4rxPM3XrNa6YaT3bmlMxirzVqRhn4S/GJsPZ64lf47k8YhyDeoYu1m4Im3uY8LIH0
         wERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003810; x=1705608610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nroJZiC7AhrV4xd5yaNbEFGd0fEvlZ1Aoag8XOO3VnI=;
        b=APFBmXRiCxjRHjc3huu80QoZ1tp3hcxa6e1NfCpsNwIQMkX3/bKAGsdwMee7j98Gxe
         s9Kb+u+hZ/RDNBj0KV6bjWxE0B+KOILGlOGdgnogFjc37ZJ8wBNRJ/fs8d8G/XFda3AX
         ZyHsg8fIwi4reAgVLh7iWLWca15fO9yitnCN3l4lzViZ7Th4kuMWp2l+gjwIU6+6vr00
         ft0VPED2fG2607P4mM9lfwHVKl3sT8zEwColfdVRmHDnT9oTm+Ew5avGKcSGHJrmfInq
         A/5Ea/VJ2Lt/Qbe5F0JVVTa31HVTHezIdfJkC+S4i/6pDwRVc8xN4mbQ0iIRfqwQwVlL
         ZWeQ==
X-Gm-Message-State: AOJu0YyaZrf+Yb/2gXg410hswv0dsf/tQcHe5aMfLP/BBr4qh46JkuYA
	a5hnWk/1HLIMFt+6ZC4PPpxxCAd2kF6HjB88Ywo=
X-Google-Smtp-Source: AGHT+IEVLL9UZ6ql6fwLfE61V26mndUgPD5OXIbXFUOJXECK6XrgwEXOecNHR9s9Omlu2518D2BeH//OGQaQIBPQHMU=
X-Received: by 2002:a05:6871:80b:b0:204:2746:6a80 with SMTP id
 q11-20020a056871080b00b0020427466a80mr270963oap.78.1705003810150; Thu, 11 Jan
 2024 12:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20240111040734.112703-1-festevam@gmail.com>
In-Reply-To: <20240111040734.112703-1-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2024 12:09:44 -0800
Message-ID: <CAMKF1sp=0T4Ow_F=DwOL7BxZU=j8D4z2eaP9qXa44kwOo9Ha1A@mail.gmail.com>
Subject: Re: [oe] [PATCH] v4l-utils: Update to 1.26.1
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 20:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108228

fails with systemd

https://errors.yoctoproject.org/Errors/Details/749633/

On Wed, Jan 10, 2024 at 8:07=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Update to 1.26.1.
>
> Also remove the Makefile.am patches as they no longer apply due to
> the swith to Meson.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  ...-Don-t-install-libmediactl-and-libv4.patch | 46 -------------------
>  ...02-original-patch-mediactl-pkgconfig.patch | 23 ----------
>  ...iginal-patch-export-mediactl-headers.patch | 26 -----------
>  ...4l-utils_1.24.1.bb =3D> v4l-utils_1.26.1.bb} | 29 +++++-------
>  4 files changed, 11 insertions(+), 113 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Re=
vert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
>  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-or=
iginal-patch-mediactl-pkgconfig.patch
>  delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-or=
iginal-patch-export-mediactl-headers.patch
>  rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.24.1.bb =3D> v4l=
-utils_1.26.1.bb} (75%)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-me=
dia-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multime=
dia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-=
libv4.patch
> deleted file mode 100644
> index 52f0cd3388a6..000000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl=
-Don-t-install-libmediactl-and-libv4.patch
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
> -       utils/media-ctl/Makefile.am
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
> --noinst_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
> --
> -+lib_LTLIBRARIES =3D libmediactl.la libv4l2subdev.la
> - libmediactl_la_SOURCES =3D libmediactl.c mediactl-priv.h
> --libmediactl_la_CFLAGS =3D -static $(LIBUDEV_CFLAGS)
> --libmediactl_la_LDFLAGS =3D -static $(LIBUDEV_LIBS)
> -+libmediactl_la_CFLAGS =3D $(LIBUDEV_CFLAGS)
> -+libmediactl_la_LDFLAGS =3D $(LIBUDEV_LIBS)
> -
> - media-bus-format-names.h: ../../include/linux/media-bus-format.h
> -       $(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIX=
ED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
> -@@ -18,9 +17,6 @@ CLEANFILES =3D $(BUILT_SOURCES)
> - nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
> - libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
> - libv4l2subdev_la_LIBADD =3D libmediactl.la
> --libv4l2subdev_la_CFLAGS =3D -static
> --libv4l2subdev_la_LDFLAGS =3D -static
> --
> - mediactl_includedir=3D$(includedir)/mediactl
> - noinst_HEADERS =3D mediactl.h v4l2subdev.h
> -
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-=
patch-mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-ut=
ils/0002-original-patch-mediactl-pkgconfig.patch
> deleted file mode 100644
> index d52475974f0a..000000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-m=
ediactl-pkgconfig.patch
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
> -@@ -20,6 +20,7 @@ libv4l2subdev_la_LIBADD =3D libmediactl.la
> - mediactl_includedir=3D$(includedir)/mediactl
> - noinst_HEADERS =3D mediactl.h v4l2subdev.h
> -
> -+pkgconfig_DATA =3D libmediactl.pc
> - bin_PROGRAMS =3D media-ctl
> - media_ctl_SOURCES =3D media-ctl.c options.c options.h tools.h
> - media_ctl_LDADD =3D libmediactl.la libv4l2subdev.la
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-=
patch-export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps/v=
4l-utils/0003-original-patch-export-mediactl-headers.patch
> deleted file mode 100644
> index f6fcee92eab1..000000000000
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-e=
xport-mediactl-headers.patch
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
> -@@ -17,8 +17,8 @@ CLEANFILES =3D $(BUILT_SOURCES)
> - nodist_libv4l2subdev_la_SOURCES =3D $(BUILT_SOURCES)
> - libv4l2subdev_la_SOURCES =3D libv4l2subdev.c
> - libv4l2subdev_la_LIBADD =3D libmediactl.la
> --mediactl_includedir=3D$(includedir)/mediactl
> --noinst_HEADERS =3D mediactl.h v4l2subdev.h
> -+otherincludedir =3D $(includedir)/mediactl
> -+otherinclude_HEADERS =3D mediactl.h v4l2subdev.h
> -
> - pkgconfig_DATA =3D libmediactl.pc
> - bin_PROGRAMS =3D media-ctl
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> similarity index 75%
> rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
> rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> index f314d9b6aed5..a801368c1082 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> @@ -18,34 +18,27 @@ LDFLAGS:append =3D " -pthread"
>  # Needs further investigation
>  GLIBC_64BIT_TIME_FLAGS =3D ""
>
> -inherit autotools gettext pkgconfig
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[qv4l2] =3D ",-Dqv4l2=3Ddisabled"
> +PACKAGECONFIG[qvidcap] =3D ",-Dqvidcap=3Ddisabled"
> +PACKAGECONFIG[v4l2-tracer] =3D ",-Dv4l2-tracer=3Ddisabled,json-c"
>
> -PACKAGECONFIG ??=3D "media-ctl"
> -PACKAGECONFIG[media-ctl] =3D "--enable-v4l-utils,--disable-v4l-utils,,"
> -PACKAGECONFIG[qv4l2] =3D ",--disable-qv4l2"
> -PACKAGECONFIG[qvidcap] =3D ",--disable-qvidcap"
> -PACKAGECONFIG[v4l2-tracer] =3D ",--disable-v4l2-tracer,json-c"
> +inherit meson gettext pkgconfig
>
>  SRC_URI =3D "\
> -    git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable=
-1.24 \
> -    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.pat=
ch \
> -    file://0002-original-patch-mediactl-pkgconfig.patch \
> -    file://0003-original-patch-export-mediactl-headers.patch \
> +    git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable=
-1.26 \
>      file://0004-Do-not-use-getsubopt.patch \
>  "
>
> -SRCREV =3D "8799081b143627c9c09dea0c60ad3d1cc17cc848"
> +SRCREV =3D "5fa4eb45ee2fd447c102b35da61c0b8920398b20"
>
>  PV .=3D "+git${SRCPV}"
>
>  S =3D "${WORKDIR}/git"
>
> -do_configure:prepend() {
> -    cd ${S}; ./bootstrap.sh; cd -
> -}
> -
> -EXTRA_OECONF =3D "--enable-shared --with-udevdir=3D${base_libdir}/udev \
> -                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
> +# Disable the erroneous installation of gconv-modules that would break g=
lib
> +# like it is done in Debian and ArchLinux.
> +EXTRA_OEMESON =3D "-Dgconv=3Ddisabled"
>
>  VIRTUAL-RUNTIME_ir-keytable-keymaps ?=3D "rc-keymaps"
>
> @@ -72,7 +65,7 @@ RDEPENDS:qv4l2 +=3D "\
>  RDEPENDS:qvidcap +=3D "\
>      ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
>
> -FILES:rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> +FILES:rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc* ${system=
d_unitdir}/system/*"
>
>  FILES:${PN} =3D "${bindir} ${sbindir}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108221): https://lists.openembedded.org/g/openembedde=
d-devel/message/108221
> Mute This Topic: https://lists.openembedded.org/mt/103656727/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

