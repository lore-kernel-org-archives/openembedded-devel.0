Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E43CD44152
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:47:46 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.22553.1732128462995264879
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDxSkFW9;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e6104701ffso88500b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 10:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732128462; x=1732733262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID+iB69UmQq/IoEd2lHqGEZ/om0RaGMRnbTCGSzafB4=;
        b=EDxSkFW9qqx7LueOM0x6GmJGptgowTaTj/CHH6MIMc1NAld8b5dtr1JI3zqmgXau9x
         z8/a1arTXRS0nEX6nwPcWhBD2wSbT8uURkl64VfRHfUyPHU0Zq/QLkuIblAVJDX6OxpF
         yeDZSbJR79ftgZ0EsTsP4Fxr1RrNg4EdNILZlZJM8V3mIGZoE3zF2QsWFBH4XNCj1gP4
         FczKFW3IT+3c/ukpC3e/aXVTZFi65txrLiZ5GxaZQeX05ld8tD+xQL3jz+Ob0/s+Ezca
         VRhEQ/xDnd+B8YuV83b6ZbH/yykNVG+lknFzzWmx7rq2uLg6q8rPbdpfUysW4yhobrhi
         h8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732128462; x=1732733262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID+iB69UmQq/IoEd2lHqGEZ/om0RaGMRnbTCGSzafB4=;
        b=eNhyw7hwGehb5gvLVNKZwpgxy2mwelMQwHknh+aHmXeaRBgqBB1UZP0X1JZwHNHYa+
         AHLji9bOdjyK87SAELqkciaC4AwucVdbhl/t+IssZm9qtwHVmBgPAUARjvBwuKjUcPmW
         jvL75jymWZ4PS/lBFZ1wvZMfSQ4cY4oWn6NELjwdl7XqduioCzDCfGtxZGbAxfKpaSnI
         SIiV/Jjzy7xhHQ2czR+WDqImWjALbaT+8l+q6JpRxgGZd8SECpxEoHrkOFYCsAzwo0ld
         78tbWko4AX4waJZ4eFxZQIUMlr90nXfOWIbsMeQm6VBK6ftZkM43o3IX3a6TgG/94Xiv
         +OvA==
X-Gm-Message-State: AOJu0YxB863Gu7MTLdcs38Py8AHCIe04y16PtkCPU8FD/16o92qPNuUC
	berYQFJ3JYpbAIYrup7fs7vo/aHmF+wkWJ1veVz4SNddcvxXtrITKkQOgoeS6zxLWRBI9Zef90n
	Kvfyvl+Y65YwzxRveMiw69CKYyU0=
X-Gm-Gg: ASbGncsn60VulbE506tjFZo+nhIwG6mOBfHyG9LwwnLPcOuaOnh72jiZNfukr5s/frp
	NHeDbsfQ59DjsQmp+kW7+SlATRuyRbQ==
X-Google-Smtp-Source: AGHT+IFAmEuV4OSJPUyeQL4lPC5AwYBCR0yyWTGeXZsGl1uksYWmxeKU/t4bWNNVwRSrnk7PR1V0ay4occyR+4C4VqU=
X-Received: by 2002:a05:6808:2519:b0:3e5:e4b2:8f10 with SMTP id
 5614622812f47-3e7eb6eca0amr3794336b6e.18.1732128462247; Wed, 20 Nov 2024
 10:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20241120160005.8473-1-hiagofranco@gmail.com>
In-Reply-To: <20241120160005.8473-1-hiagofranco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 10:47:16 -0800
Message-ID: <CAMKF1spM=H5As9y+aS+cAAmuqjZ0qfsL7_mqEm_dtGM92U3-Gw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native variant
To: hiagofranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113936

On Wed, Nov 20, 2024 at 8:01=E2=80=AFAM Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This is a requirement for libdisplay-info version 0.2.0, which fails
> without hwdata-native:

Thanks for the patch. I had to transplant it on top of 0.389 recipe
since this was
staged in master-next please check the branch and test it out if it works a=
s e

>
> | WARNING: CMake Toolchain: Failed to determine CMake compilers state
> | Build-time dependency hwdata found: NO (tried pkgconfig)
> |
> | ../git/meson.build:24:11: ERROR: File /usr/share/hwdata/pnp.ids does no=
t exist.
> |
> | ERROR: meson failed
> | WARNING: exit code 1 from a shell command.
> ERROR: Task
> (poky/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb:do_co=
nfigure)
> failed with exit code '1'
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  meta-oe/recipes-support/hwdata/hwdata_0.388.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb b/meta-oe/rec=
ipes-support/hwdata/hwdata_0.388.bb
> index 63fcfb22b707..dde9647479a3 100644
> --- a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
> +++ b/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
> @@ -24,3 +24,5 @@ do_install() {
>
>  FILES:${PN} =3D "${libdir}/* \
>                 ${datadir}/* "
> +
> +BBCLASSEXTEND +=3D "native"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113929): https://lists.openembedded.org/g/openembedde=
d-devel/message/113929
> Mute This Topic: https://lists.openembedded.org/mt/109686459/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

