Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DCBC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 16:26:46 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.3506.1739291200867322688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 08:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACzSG5yx;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5fc9e64d96dso220073eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291200; x=1739896000; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcDGaZPvEFmlb8BLy2zQj50IaItNWK0MtnllJFpgB68=;
        b=ACzSG5yxy5/21fD0UG7aewh+GxBK3hQ8IYEvlQq3JjA/04NJW3CndCQltG6Qa+LNZG
         E7mN36LtZiWUaprun+tcZeTgNuRdCa4xJfoCjaRR988SlHSSgGWmlxUnD+tKZe3Siym8
         4TKuKrZYjyaOWBLMsw4yS49zHg7QfkYq3CCLvEqyHmGeq5p1SZwdhGw21iqSUT8xqUQi
         Ve6PTkNveHPtvv0FQZOrX34SLsuq6k55DYBltOeYbXLQTwKdFVr88tWuIesVmYSAofo2
         foaGrc90Y4mRA6cAW3otIO5UPMwwYQPXxEW0/wgcZqPVCOvStGnnQ7q7H85Gcn6rSoNP
         X1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291200; x=1739896000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcDGaZPvEFmlb8BLy2zQj50IaItNWK0MtnllJFpgB68=;
        b=QxOzGaTNzqmIPHkrpqCn6NtgxZ37WfKWXVYrYvlAnDccAF4P7z16Xy2CreK56Yacb/
         UQhx13NkKwF9RGvGxDWecmmYBa1zbcVjnzlK2XtJTwLHmf7k3fxQIvxBxz4vc10JXI0w
         oif20eW8F8mCR5T6e4l73AivUw8hqP54hkEJJSa+BoHauJ7eojq4WK1hc1y+DGxWAr63
         AX3bHJr5vwJzbVe2FfAOyIiA8uhTiejxej3D2s5nUOIseZn9uCyp+2VsbLl5CalU5YvI
         8pM8tP2A/ePB3GO5lqsJpLBBswnP2AxDgO7JooJsnez5bnR1+LzAM2FCOjKG+4kPp+We
         Xq/A==
X-Gm-Message-State: AOJu0Yxw9EjQls5NIZ5+36TgX2v6llOVaYDhuvAaASd8S9DSSl+chNKy
	e3WviJou//hGO+HUNXIkOLkoT4bvQQq4BkFv58Zvc0WyLVkdycet6IZPkwX656eclHCiirajIOu
	ZbrDUJY77ZB+wZWe0ct+Q5C5hkZ8=
X-Gm-Gg: ASbGncvpgsXkI6G+441zsDtOaxnwmC71H81Yf9BGnA0mSYSP5taneLfocUYCZbmPz+h
	nWpWfnzYFfUJwt6GfqCHvb0S60MlSJogZNmnQYJyJD8qaEIe+ZMAuU79vm9uOLek1ayBOUoDg
X-Google-Smtp-Source: AGHT+IE14Ssz63hmoPRTCPyVqwowNjxT/UuaG30AUykaS6VcWrQEdErJjZ2hAKoYTTBMgMZFXxDGLlys9p/CawRXYks=
X-Received: by 2002:a05:6870:c6a8:b0:29f:8a1b:f76b with SMTP id
 586e51a60fabf-2b8d64a4bc4mr8542fac.9.1739291199863; Tue, 11 Feb 2025 08:26:39
 -0800 (PST)
MIME-Version: 1.0
References: <20250211133155.4081059-1-skandigraun@gmail.com>
In-Reply-To: <20250211133155.4081059-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2025 08:26:14 -0800
X-Gm-Features: AWEUYZnFYz9U2g0XzLNf-QIKDhkci3XbjYh9x6w7C2WGd0xRcdTfC8qDwXifBb0
Message-ID: <CAMKF1sqEKiL9HiGevbZ_6tu3rf3sn0XfhpUmcax33CuKbBXSjA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH v2] mutter: fix profiler PACKAGECONFIG
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 16:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115430

I have 47.5 staged in master-next, do we need this patch on 47.5 ? if
we do then please rebase it on master-next and resend please.

On Tue, Feb 11, 2025 at 5:32=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> In case "profiler" PACKAGECONFIG is enabled, the build fails with
> the following error:
>
> | ninja: error: '/usr/share/dbus-1/interfaces/org.gnome.Sysprof3.Profiler=
.xml', needed by 'src/meta-dbus-sysprof3-profiler.c', missing and no known =
rule to make it
>
> meson.build script is looking explicitly for a required file using the
> sysroot of the build system instead of ${RECIPE_SYSROOT}. To avoid this,
> patch meson.build to prefix this path with ${RECIPE_SYSROOT}.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...-Dont-use-system-sysprof-dbus-folder.patch | 35 +++++++++++++++++++
>  .../recipes-gnome/mutter/mutter_47.4.bb       |  2 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-s=
ystem-sysprof-dbus-folder.patch
>
> diff --git a/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-s=
ysprof-dbus-folder.patch b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-=
use-system-sysprof-dbus-folder.patch
> new file mode 100644
> index 000000000..2f09c3299
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-=
dbus-folder.patch
> @@ -0,0 +1,35 @@
> +From 790177e2a89aa0710b570d595223bdb511241c56 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Tue, 11 Feb 2025 13:39:54 +0100
> +Subject: [PATCH] Don't use system sysprof dbus folder
> +
> +In case Mutter is built with profiler support, it requires
> +org.gnome.Sysprof3.Profiler.xml file to be available - however
> +the meson build file is trying to access it on the build machine's
> +system ($datadir/dbus-1/interfaces) instead of searching for it
> +in the $RECIPE_SYSROOT.
> +
> +To ensure that it looks for this file in the correct folder, prefix
> +the search path with the value of the sys_root property, which is set
> +in the meson.cross file (by meson.bbclass).
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +
> +Upstream-Status: Inappropriate [oe-specific: only related to cross-compi=
ling]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 551cb23..5199be6 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -446,7 +446,7 @@ if have_profiler
> +
> +   if libsysprof_capture_dep.type_name() =3D=3D 'pkgconfig'
> +     sysprof_dep =3D dependency('sysprof-6', 'sysprof-4')
> +-    sysprof_dbus_interfaces_dir =3D sysprof_dep.get_variable('datadir')=
 / 'dbus-1' / 'interfaces'
> ++    sysprof_dbus_interfaces_dir =3D meson.get_external_property('sys_ro=
ot') + sysprof_dep.get_variable('datadir') / 'dbus-1' / 'interfaces'
> +   else
> +     sysprof_dbus_interfaces_dir =3D mutter_srcdir / 'subprojects' / 'sy=
sprof' / 'src'
> +   endif
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_47.4.bb
> index 30301dac2..fe30aa60c 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
> @@ -24,6 +24,8 @@ DEPENDS =3D " \
>
>  inherit gnomebase gsettings gobject-introspection gettext features_check
>
> +SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
> +
>  SRC_URI[archive.sha256sum] =3D "f531fc00e6ec6dbb570b3bf942b6490f7a93df91=
c4c267a918b4d2afe9211bda"
>
>  # x11 is still manadatory - see meson.build
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115428): https://lists.openembedded.org/g/openembedde=
d-devel/message/115428
> Mute This Topic: https://lists.openembedded.org/mt/111121898/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

