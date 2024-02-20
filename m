Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9017BC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 03:52:11 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.5978.1708401129683984844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 19:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXDn6DWB;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-21e45ed41d7so1941342fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708401129; x=1709005929; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRNV+7HwNcBo+wHIWVRcNnQc/N3sb2UZlX0JmpOL0QE=;
        b=bXDn6DWBonLBC9yZ/JpUIZ6geHa0WWXmYxw15tNK1mWQvXDUKLPBoAh4zwmZN68UZg
         X7Yxewa5LaEACIjg2MHYUYtjahzHwrWGlgxrHK9LVveqAghI8dumpmUFIicjmZ1eR7mF
         bdceVzhHtM+Akq6q5Ze8cDtqjQxxiJV6mHPrrgciLPhsrpyg8WqLs0LZ/DtodcQhzloT
         5efoDRJ8zZRLJHAvfefpsSHiwcUmJEwFb1Q6xCSoq+BeMPCs0SWHw7QHLQ6M9CSafsbU
         4/uqsg9XT37gywSHAKHdC2r9YM321C+lb/xL/+Re1WWlabPucOm6wu9gNY0q21FvTN7m
         73mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708401129; x=1709005929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRNV+7HwNcBo+wHIWVRcNnQc/N3sb2UZlX0JmpOL0QE=;
        b=LXg5Inp3lMDEyOf81rHIRcarwtLUEmxmYLaIKDkXlT4HZTI7LmsjCw12EUQ/Um+5xd
         1a5In4L8x3KXq/2qhpf/okqrTd6qZPEYK9Nm5gMd8oV+AlkW5uDOVtOTuNu4xyo1Sp6K
         wkliTCO+V6V4gHnwUyonDgvGD01MrP0vSav9CB4nDhjJZzgy3UlK3DF77/THieOQKoaI
         EpFppNb/U8Yc24zkoWICGdGAB3c4uo8SgYkvwZqSxwwPdVHN8ynXs+iqfD4et6cDGEc/
         r7yRpqpWE6NwhExOvZyn7GayTDE/IiM9KGd57HPv3MqZ9b91ffw/qVTIzzTVusXsXcSY
         bkTw==
X-Gm-Message-State: AOJu0YzeU47tTv9smoJqCDQDB95v41Zj29RyVD52ihbdS01lyy3iXuuK
	rNLIj82C6m4zStQa86dvzU7Haze1LaUBtcE/YH0boVEPgCWemvnao4WMgenKlAo61Q+J/GPPiJ+
	EsM2M1MEbz5Rzk8bSPP+MXtn/FhM+M3yEs029Jg==
X-Google-Smtp-Source: AGHT+IFQ7Md47/9ARTxCWRhJ5yTjtWB8YSZHBEvR7p0LkNRR1mCi9NPpQ7P9xWzuB2F0hABl07r95hmvgdw0jpyDBI4=
X-Received: by 2002:a05:6870:55ca:b0:21e:4e1e:6fbf with SMTP id
 qk10-20020a05687055ca00b0021e4e1e6fbfmr12781134oac.5.1708401128873; Mon, 19
 Feb 2024 19:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20240219070140.149267-1-f_l_k@t-online.de> <20240219070140.149267-2-f_l_k@t-online.de>
In-Reply-To: <20240219070140.149267-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Feb 2024 19:51:43 -0800
Message-ID: <CAMKF1sqfdZH0AQniMSVjavGbiX85mPNX2N5yq8bV+QRS_kzfhg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] gedit: update 46.1 -> 46.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 03:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108900

with clang (clang-18) I am seeing this error

https://errors.yoctoproject.org/Errors/Details/753847/

On Sun, Feb 18, 2024 at 11:01=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gedit/{gedit_46.1.bb =3D> gedit_46.2.bb}=
 (92%)
>
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.2.bb
> similarity index 92%
> rename from meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> rename to meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
> index c0221b9a7..c073eb9b9 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.2.bb
> @@ -23,7 +23,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc get
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>
> -SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016=
b1e17e869caf5bfb94c6aa4e"
> +SRC_URI[archive.sha256sum] =3D "c0866412bad147ebace2d282ffcbb5a0e9a304b2=
0fd55640bee21c81e6d501ef"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108844): https://lists.openembedded.org/g/openembedde=
d-devel/message/108844
> Mute This Topic: https://lists.openembedded.org/mt/104442407/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

