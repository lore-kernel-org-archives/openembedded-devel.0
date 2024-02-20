Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7254BC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 06:31:12 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.7985.1708410662895681444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 22:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOrl/Fbu;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21ef7be6772so886794fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 22:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708410662; x=1709015462; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQEYwHcAfUGdRmiSgQ5EkjbtJZIJYt728IDaHg1Snb0=;
        b=TOrl/FbuzEtNDDixh3aAqyDahglYja4OiDb6+1ILpOQaXuNIO1mxPiM9u7mOwRM2BV
         TniMrJ3BPLU0oYWJzM7BATY0BqJyjC6KOy8paSdapfmZInhDIdhDowtd+vEEZvOkEbgL
         AhYz1en2hdOWY78B4prg5ryqi0L+LZKb3ya5rvPo4UFZ4dfmWqHihDWclMWP5PAlJUCY
         3RWraEsh0afbElAiJ0+hzQKRk9WD9sMkKF1aju+0EcI7Emyw0H1YIHTaR2l/xoJOqKIe
         hJz15Kd2QXI8Bhj3bqDnRncyL2OmydJNqjvNPFsdXsZF0TGtqCKH/RX+9ijvtF8mgK8v
         ZlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708410662; x=1709015462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQEYwHcAfUGdRmiSgQ5EkjbtJZIJYt728IDaHg1Snb0=;
        b=JH/uLomfUvalPaIqeRA9LuZzTPTl5scgcXx/9BFl3xZbBkKP16LKQTBz/qC7pmI15Q
         8tLG0sc5UupT5yqjvdhips6coFlf0sVMZfFSnh3/rpuuQnnFe4B/pHrA5dpJOkic5sPD
         bLATBxjMRsKzSI8o9Ej6oCmhy2/WmFWHmMJo6dFiK7jJkC0xwMG8I8aUccSJP9N2pN+J
         fSvjP1tcdr6HEbfBMytyf6VkkZHytKfyj9M5QEGWlfX4e8Oi0sTqtxldgUPoIeUMPnpb
         uG0fQd+P68ZW3nuB2tv7LVCD/MlPQ65dd2SLWhYB+CpB9RL8FuImkJR8UO0cumqIxvL2
         xLoA==
X-Gm-Message-State: AOJu0YzQ/ATv6k63vjfn+Amb3KDaa9nBTRVZPo8v6wFMikC759BrPWc2
	+lBoSd0d2tMhI0OTOHrvh286OAHaGqW8YfQ3lLyCpAHYYWXg3BBDWbQXzCggG79bvQHWXGljk7X
	PVFlyXT8DS0+JVbdVUXETjL/hlNc=
X-Google-Smtp-Source: AGHT+IHJq2KynsUhldJ8suYYO5ssNm2Wm0L2lIcb+9Egtpi60HN3GeZq4czvAWXB0dovZakDwFLXkicqB4LWb60kyXc=
X-Received: by 2002:a05:6870:51c9:b0:21e:fc35:73ef with SMTP id
 b9-20020a05687051c900b0021efc3573efmr2812009oaj.38.1708410662053; Mon, 19 Feb
 2024 22:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20240219070140.149267-1-f_l_k@t-online.de> <20240219070140.149267-2-f_l_k@t-online.de>
 <CAMKF1sqfdZH0AQniMSVjavGbiX85mPNX2N5yq8bV+QRS_kzfhg@mail.gmail.com> <NI359S.XCXVB5IIDB2A@t-online.de>
In-Reply-To: <NI359S.XCXVB5IIDB2A@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Feb 2024 22:30:35 -0800
Message-ID: <CAMKF1sqtM8TPsQsvn4aftiUcoGRQ=rtqBfs8PKZubw1HiL9FJw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] gedit: update 46.1 -> 46.2
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 06:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108916

On Mon, Feb 19, 2024 at 9:35=E2=80=AFPM <f_l_k@t-online.de> wrote:
>
> There is already an issue for this:
> https://gitlab.gnome.org/GNOME/gedit/-/issues/588
>
> Unlike gtksourceview, libgedit-gtksourceview seems to be missing gtk_sour=
ce_style_copy().
> I was able to fix the build by doing so, but perhaps it would be best to =
wait and see what the developers of gedit plan to do?
>

Perhaps a workaround until then is better for CI

> +++ plugins/quickhighlight/gedit-quick-highlight-plugin.c 2024-02-20 06:2=
8:14.583217602 +0100
> @@ -90,11 +90,12 @@
>   if (style_scheme !=3D NULL)
>   {
>    style =3D gtk_source_style_scheme_get_style (style_scheme, "quick-high=
light-match");
> -
> +#if 0
>    if (style !=3D NULL)
>    {
>     plugin->priv->style =3D gtk_source_style_copy (style);
>    }
> +#endif
>   }
>  }
>
>
> On Mon, Feb 19 2024 at 07:51:43 PM -08:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> with clang (clang-18) I am seeing this error https://errors.yoctoproject.=
org/Errors/Details/753847/ On Sun, Feb 18, 2024 at 11:01=E2=80=AFPM Markus =
Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de> --- meta-gnome/recipes-gno=
me/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb} | 2 +- 1 file changed, 1 insert=
ion(+), 1 deletion(-) rename meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =
=3D> gedit_46.2.bb} (92%) diff --git a/meta-gnome/recipes-gnome/gedit/gedit=
_46.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb similarity index 92=
% rename from meta-gnome/recipes-gnome/gedit/gedit_46.1.bb rename to meta-g=
nome/recipes-gnome/gedit/gedit_46.2.bb index c0221b9a7..c073eb9b9 100644 --=
- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb +++ b/meta-gnome/recipes-g=
nome/gedit/gedit_46.2.bb @@ -23,7 +23,7 @@ inherit gnomebase gsettings itst=
ool gnome-help gobject-introspection gtk-doc get def gnome_verdir(v): retur=
n oe.utils.trim_version(v, 1) -SRC_URI[archive.sha256sum] =3D "a1a6e37f0417=
65dff7227a1f5578b6f49faaf016b1e17e869caf5bfb94c6aa4e" +SRC_URI[archive.sha2=
56sum] =3D "c0866412bad147ebace2d282ffcbb5a0e9a304b20fd55640bee21c81e6d501e=
f" # gobject-introspection is mandatory and cannot be configured REQUIRED_D=
ISTRO_FEATURES =3D "gobject-introspection-data" -- 2.43.0 -=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all messages sent to this g=
roup. View/Reply Online (#108844): https://lists.openembedded.org/g/openemb=
edded-devel/message/108844 Mute This Topic: https://lists.openembedded.org/=
mt/104442407/1997914 Group Owner: openembedded-devel+owner@lists.openembedd=
ed.org Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

