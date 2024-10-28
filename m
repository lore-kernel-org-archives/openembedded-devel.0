Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A393FD3E2BB
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:21:34 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1474.1730143285430671501
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=0z6ov9tm;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.174, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb587d0436so48027371fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730143283; x=1730748083; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeGmpxBWe+RYV9J9f1mvbZkTolz1ZPzcxhi+cZZoKfo=;
        b=0z6ov9tmNtzefX3YI52Hb1P5mhEeOENtzemcZ/8HOkHhApbQaLYP2HaLjOh4usgUfA
         V5fas8XmO2n0UeTNc0EwbbiMKxODkyrcTtmi5fnuVU+9ZwMC8Ay/n11HkreOIHd0iNuF
         LB94AyTFXxer46nrjKsDnzjxikUftpBGn3r0RTvddSTmH9dUDhihLBWZUHGPky7rWRDo
         m7wabYoCefTjQzj1NqzpMzPDACckQj8hvU3lII1ST956hd8rfYqXhqVkl/PARTPsX8C3
         sR8Nah27sHklI8THEym0Bd/Cj16wpGyPnUixIuR9CseVSp5g9/2EJteeIqmDfjTd3Bfr
         IOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730143283; x=1730748083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeGmpxBWe+RYV9J9f1mvbZkTolz1ZPzcxhi+cZZoKfo=;
        b=W+53EPt++h9p1fT46I10HQ2vvjTxdw4UkQY1NBgOs0CHM2GHgbUzNUo/J5quHrleHz
         rHnRplewnuBh8iU+5SideK9KAZj0Unr2d24Las9ibarTCprkiw5B5U26fV3p4XfMSFG0
         W4+8dE2BogF+4sQb+2jTzqguk1nmCmi1VjajeGaKKo3UJnrZ3TSWg5j7aJcrN0HyHO6g
         kzokIfOn2UXtsAwzc2g+p7qov+T8I8AkByPZX9OKVkjE6eviK2GGFP0LJTpnNsY+W082
         kQoCfgJzbQ09tnu6YYt9zMpwWEPtqlLQqQfr1p/I92+F4ZglrDndI48bY5WAShpWIrnq
         vpoQ==
X-Gm-Message-State: AOJu0YxOsuQokyvQiHwpaC0R8zknCLKt1Lnl7GpHrXjJPvUIZ+pUjKpr
	tvcf/MBvlGfRFiKgK6kGWJ0Wr5Qjy15LpBwDlOOlZaZDTOZ6/9wkFeIdPcSo28E9ndkcXhYDgLC
	DX8DY+6ssdcoK3psoAoJkiNxXRwJzAVDphnvfIA==
X-Google-Smtp-Source: AGHT+IE1L15dmZmP7riUkmXsikfGxuDPY1syUby8W23haXczb1c6QvBKKQb5tCKaq8NydivbRN/d7kyIH8lIWs5L/sc=
X-Received: by 2002:a2e:be20:0:b0:2fb:4f8e:ef9 with SMTP id
 38308e7fff4ca-2fcbe0671e0mr36259091fa.30.1730143282434; Mon, 28 Oct 2024
 12:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241028112450.2793248-1-max.oss.09@gmail.com>
In-Reply-To: <20241028112450.2793248-1-max.oss.09@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 28 Oct 2024 20:21:11 +0100
Message-ID: <CAMRc=MdUQ59LmOZAJd=E7qjFiT9UGq2vx4zsHgR3cx7-kNhd=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod_2.2: depend on glib-2.0
To: max.oss.09@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 19:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113265

On Mon, Oct 28, 2024 at 12:26=E2=80=AFPM Max Krummenacher via
lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> In my setup a build fails with
>
> | checking for gobject-introspection... configure: error: gobject-introsp=
ection-1.0 is not installed
> | NOTE: The following config.log files may provide further information.
> | NOTE: /var/home/krm/build/oe-core_master/build/tmp/work/cortexa55-tdx-l=
inux/libgpiod/2.2/build/config.log
> | ERROR: configure failed
>
> From config.log this seems to be related to glib-2.0 not found:
>
> | configure:22484: $PKG_CONFIG --exists --print-errors "gobject-introspec=
tion-1.0"
> | Package glib-2.0 was not found in the pkg-config search path.
> | Perhaps you should add the directory containing `glib-2.0.pc'
> | to the PKG_CONFIG_PATH environment variable
> | Package 'glib-2.0', required by 'gobject-introspection-1.0', not found
> | configure:22487: $? =3D 1
> | configure:22491: error: gobject-introspection-1.0 is not installed
>
> Note that glib-2.0.pc is present in recipes-sysroot-native but not
> in recipes-sysroot.
>
> Adding glib-2.0 to depends allows successful build of libgpiod 2.
>
> Fixes: 117d09ce43c7 ("libgpiod: update to v2.2")
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> I'm unsure if that is the correct fix.
> I would have expected that if gobject-introspection-1.0.pc depends
> on glib-2.0 to be present, then the inherit of gobject-introspection
> would have done the needful.
> However I'm not really familiar with gobject-introspection in the
> first place.
>
> Max
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.2.bb
> index b55da72f7b7f..3d9758e27af7 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e9a=
20f \
>  "
>
> +DEPENDS +=3D "glib-2.0"
> +

Pulling in the entire GLib for everything in this recipe is definitely
a wrong answer. I'm travelling and have limited time right now but I
will take a look on Thursday or Friday. I did test disabling
introspection though so I'm surprised to see this.

Bart

>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
>  SRC_URI +=3D "file://gpio-manager.init"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113260): https://lists.openembedded.org/g/openembedde=
d-devel/message/113260
> Mute This Topic: https://lists.openembedded.org/mt/109255084/3618139
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [b=
rgl@bgdev.pl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

