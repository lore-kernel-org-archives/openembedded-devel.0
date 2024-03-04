Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFEDC54E49
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 23:48:30 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.9191.1709596105501155299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 15:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DySV43Bb;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e4f1660493so418098a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709596104; x=1710200904; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPm0lBub1jCZFxMh3K4MovC5Ej7FB7sKS++evN887Z4=;
        b=DySV43Bb4fA1lnb3rUPz3mARg6KdnUtK7caHtC6U5YwI4eG44UMIMScof1oC1aDRAi
         4vThuMfOZptGGNjdqA6zCxcSXvq/7nufINXlrw5jG63vXA0dh+wYYFSI/gcGSiacI8Za
         GVoRRwBn1EafiNeBRpxWUOz5AVhWIDNwQavoN6fO1SeVareHZRKPukMaTuzQN8L0FNxu
         eoz+V/psvvPg15JjSt6RnFaegSFgGEFdlnOnQI0QsknwfqOyX/Yy4KUz2ee4rubK8qia
         Pbl7REUBjnq29vyCd7FpFSdluV3nhmYIoOpefYO6Qqn8WVA5dCVYynIwo36Uvd4woNDR
         s7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709596104; x=1710200904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPm0lBub1jCZFxMh3K4MovC5Ej7FB7sKS++evN887Z4=;
        b=pQG9F0aULDq/UAIsx7N7CUylWP9EtOGYYx8sUh2tm2M3TZIQadcB8EZyoh/FlSXFrz
         zdATqtNXd48cFrHgVt/LgpRRDvOtzR1KzmZsA58dnxkhduQW8QAvtszdXb41SF2yOmQG
         5pT7SgQACI0lP4BtYAGUd25IptsFuMx3h/lBrYOWqms2QJ7oL0ZpZaseDP89qF+PB++7
         PWi70litQE5XPvOAHljXctX/VEgYM/9SOObtTBUyJlf/71NXcKTgU4wS/kmWvVV9Xedd
         26oh3x2WmEk8zEzoYAo9U3YikxSs3Ge63JdIfaVesCVLak01XSXp0vVQ5fflfCRxugt4
         hHdA==
X-Gm-Message-State: AOJu0YyjsextcaAeeht3ZT95wpwCpR99jmZ/209Al3xl0Buvv3bE+OII
	qPrj1aYlGZiiBEWoHnR02ZOxp7j5oG6ZwQWQnkT0xcOcs1QER4VYqRi9jWuclmRSqcnjbQJ+gx2
	p2c1e0DASiOLorviZdNY/9xeMhxk=
X-Google-Smtp-Source: AGHT+IGLYGaMOM9GH9UJ1iTlI8OmC1l6QP09P48lGZjNOLc6KpaKnbNSGPvbaKMgjNAmPUyqtlzy+qHjPKUbbLxfFjs=
X-Received: by 2002:a05:6870:a44f:b0:21f:1fcf:8c24 with SMTP id
 n15-20020a056870a44f00b0021f1fcf8c24mr219435oal.57.1709596104339; Mon, 04 Mar
 2024 15:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20240304201312.1089609-1-yoann.congal@smile.fr>
In-Reply-To: <20240304201312.1089609-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Mar 2024 15:47:57 -0800
Message-ID: <CAMKF1spa5cCKTYdCJq6sxvDwVjGXWVHHWmyDBc9P=7Dh9mTOxQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] drbd-utils: Fix a udev rule reproducibility
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 23:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109104

which branch is it meant for ?

On Mon, Mar 4, 2024 at 12:13=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> drbd-utils configure step check the build host udev version to enable
> or disable the target udev rule. This leads to a clear
> non-reproducibility.
>
> This patch fixes this by adding a configure option to the configure step
> which allows to skip the udev version checks and unconditionally enable
> the udev rule.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  ...-an-option-to-disable-host-udev-vers.patch | 55 +++++++++++++++++++
>  .../recipes-support/drbd/drbd-utils_9.22.0.bb |  2 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-=
configure.ac-Add-an-option-to-disable-host-udev-vers.patch
>
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-configu=
re.ac-Add-an-option-to-disable-host-udev-vers.patch b/meta-networking/recip=
es-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-=
udev-vers.patch
> new file mode 100644
> index 0000000000..5e03ff7b32
> --- /dev/null
> +++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-A=
dd-an-option-to-disable-host-udev-vers.patch
> @@ -0,0 +1,55 @@
> +From 50749a5b0eb0becb39a4edb5fe844b13bbeb5836 Mon Sep 17 00:00:00 2001
> +From: Yoann Congal <yoann.congal@smile.fr>
> +Date: Sat, 2 Mar 2024 16:23:07 +0100
> +Subject: [PATCH] configure.ac: Add an option to disable host udev versio=
n
> + checks
> +
> +In cross-compilation environment, the build host might have an outdated
> +udev or no udev at all. But the user may still want to build with the
> +enabled udev rule (for its udev-enabled target).
> +
> +This patch adds a "--disable-udevchecks" option the disable build host
> +udev version check at configure-time and unconditionally install the
> +enabled udev rule. Without this new option, the behavior stays the same
> +(checks enabled).
> +
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +Upstream-Status: Submitted [https://lists.linbit.com/pipermail/drbd-dev/=
2024-March/007201.html]
> +---
> + configure.ac | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d5a0e733..da083240 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],
> +       [AS_HELP_STRING([--with-udev],
> +                       [Enable udev integration])],
> +       [WITH_UDEV=3D$withval])
> ++AC_ARG_ENABLE([udevchecks],
> ++      [AS_HELP_STRING([--disable-udevchecks],
> ++                      [Disable host udev version checks])],
> ++      [],
> ++      [enable_udevchecks=3Dyes])
> + AC_ARG_WITH([xen],
> +       [AS_HELP_STRING([--with-xen],
> +                       [Enable Xen integration])],
> +@@ -309,7 +314,7 @@ if test -z $GIT; then
> +    AC_MSG_WARN(Cannot update buildtag without git. You may safely ignor=
e this warning when building from a tarball.)
> + fi
> +
> +-if test $UDEVADM =3D false && test $UDEVINFO =3D false; then
> ++if test "x$enable_udevchecks" !=3D "xno" && test $UDEVADM =3D false && =
test $UDEVINFO =3D false; then
> +    if test "$WITH_UDEV" =3D "yes"; then
> +      AC_MSG_WARN([udev support enabled, but neither udevadm nor udevinf=
o found on this system.])
> +    fi
> +@@ -413,7 +418,7 @@ dnl default.
> + test -z $INITDIR && INITDIR=3D"$sysconfdir/init.d"
> +
> + dnl Our udev rules file is known to work only with udev >=3D 85
> +-if test "$WITH_UDEV" =3D "yes"; then
> ++if test "x$enable_udevchecks" !=3D "xno" && test "$WITH_UDEV" =3D "yes"=
; then
> +    udev_version=3D$( set -- $($UDEVADM version); echo $1 )
> +    if test -z "$udev_version"; then
> +       udev_version=3D$( set -- $($UDEVINFO -V); echo $3 )
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb b/=
meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> index 960260fd39..65a43d9b26 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/LINBIT/drbd-utils;name=3D=
drbd-utils;branch=3Dmaster;prot
>             file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
>             file://0001-replace-off64_t-with-off_t.patch \
>             ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://000=
1-drbd-utils-support-usrmerge.patch','',d)} \
> +           file://0001-configure.ac-Add-an-option-to-disable-host-udev-v=
ers.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://0002-drbdadm-drop-use-of-GLOB_MAGC=
HAR-use-strchr-heuristi.patch "
>  SRCREV_drbd-utils =3D "409097fe02187f83790b88ac3e0d94f3c167adab"
> @@ -39,6 +40,7 @@ EXTRA_OECONF =3D " \
>                  --with-initscripttype=3Dboth    \
>                  --with-systemdunitdir=3D${systemd_unitdir}/system \
>                  --without-manual \
> +                --disable-udevchecks \
>                 "
>
>  # If we have inherited reproducible_build, we want to use it.
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109102): https://lists.openembedded.org/g/openembedde=
d-devel/message/109102
> Mute This Topic: https://lists.openembedded.org/mt/104730465/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

