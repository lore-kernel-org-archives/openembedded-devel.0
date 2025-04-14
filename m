Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154C2C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 21:03:29 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.5528.1744664601186531706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 14:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6Tpwipu;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bb97260ceso1576663a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 14:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744664600; x=1745269400; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xv8iTGzN1Ym6f+143FYPeN8lI9hAQw59dgzYDo3sa+8=;
        b=N6Tpwipu1psiUBHQGDSYZRK58I3r3kL6DXrRsynXsRBAXbFgcOBxztnUInqnY04zSB
         hWWNnqwxyFXQAVUyALXlIOVkF7uJ553PoE58cERL6JE4eMI8KC2MQEs4zB0VbcVa9u/j
         /TUasheKtOW4Vdh/YAjsB2aFE/B+znwas9J8NIsT3r/tclP24OmWnFmDL0GZp+g3OOac
         emTMinRHhqHDqUT6vhWReV2uk66IISX+LrDvTbKEMtA4ZowFOf7OeEdWv8GPqtSTyoBZ
         MFVLKzASkGNd3j4cFBiLBSYAZtOLptIzzVdZo3xt7GT12f5/V71q+3LZCgV/zMsAo/9A
         zxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744664600; x=1745269400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv8iTGzN1Ym6f+143FYPeN8lI9hAQw59dgzYDo3sa+8=;
        b=rVUBfSpS0bjOXooh9xnZzS1/Xh2fXUWagk8HU8+ji40ZoRkC1dWPze0Z1mE4woTgeE
         y/nbDagkz0IBN/Uj1sbQ9/ZQEXowKo60a3Xl7J8a+yULsVCD/51n3yqI2Oi34+0VcQIt
         nGh061cIFuvryMpMUjIhu0zBVPxpQOi1IuDg8HpUHEEaYmzDHam7GSmuGDQh1S5JG90S
         bvZ35Utw4z+AXbHMny8YqUlTcx9nxJcd13mUD3PJKCx6TXyyHgJY6JM+7tH04ik7Dw6q
         5wRgxhuT+51jIGvkSgbrEpb9r4zvUNNMxk8cx04JK9XTtWXQ60CotsqiVNpCyiyCxLie
         Mf5g==
X-Gm-Message-State: AOJu0YxInYNgBRJ78Z1W0isfbuMo5LKRK7huLDCcqbAKd3gSzpJjOGuF
	FzNAxwQ6pVODLoCgycH8cWMfSO1wGABpvmUREAxysvzMfbOaK8cUzIIgtu2PJ/iGUoBmP/jhKm4
	DqVKRFhGJgf3EL+4mpOh2tfg2EzVrukY1sUY=
X-Gm-Gg: ASbGncvam2f1ZkP7M0CJuNtFgYa9n/gA8tGjrwwgCS2C+fMPO3jx34QwphGQgy1QL55
	hkcOBLUStgvvsYGCDUJ9jBgWsBRR5+ZzXjkW/a2gAU4Q7mEl4GC3RUMy3mckl9BKhrrj3v8dj9e
	wWDFl/hAOZ8kKpzrlpNjh4PAgGfOaod+M=
X-Google-Smtp-Source: AGHT+IHLQAczhtwAshM9dnwMtM5lMf6UO6Rj430o3+As2DICr6tmJBf18jzDKObT2GC5QDmyNwanVK43HSXO28criaw=
X-Received: by 2002:a05:6808:2e4c:b0:3f8:a088:3e45 with SMTP id
 5614622812f47-400850f9706mr8935197b6e.36.1744664600283; Mon, 14 Apr 2025
 14:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250414170015.90559-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250414170015.90559-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Apr 2025 14:02:54 -0700
X-Gm-Features: ATxdqUFOgMEo_AgpvWAhkdg_vTww8iwvgF5IEyvnaIobTKx1myhfRLs0u73tEtc
Message-ID: <CAMKF1spY5BDKB0b=egXXD9iDSD1kJxi+qE2qKJEYufhZbbtkQA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] 1. libsimplelog: add recipe for lightweight
 high-performance logging library
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 21:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116855

On Mon, Apr 14, 2025 at 1:58=E2=80=AFPM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> 2. libsimplelog is a portable, minimal, and extremely fast logging librar=
y written in ANSI C.
>
> 3. It supports multi-threading, high throughput (up to millions log recor=
ds/sec with PC 8 CPU - see report from README.md)
>
> 4. And works on embedded Linux platforms without external dependencies.
>
> 5. Follow KISS principle.
>
> 6. A Tribute to W. Richard Stevens (1951 - 1999).
>
> 7. This recipe adds libsimplelog to meta-openembedded under recipes-suppo=
rt.
>

Thanks for reworking this. I think commit message can be made a bit
more consistent with respect to formatting we use

recipe: Short summary of change

Long description of the change

Signed-off-by

For details I would encourage to go through

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html

> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_git.bb          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelo=
g_git.bb
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> new file mode 100644
> index 000000000..0415bf485
> --- /dev/null
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -0,0 +1,21 @@
> +
> +SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful of logging librar=
y in ANSI C/C++. Ready for billion records."
> +DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o external dependencies."
> +HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517=
952ac7c"
> +
> +SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
> +
> +# Modify these as desired
> +PV =3D "1.0+git"
> +SRCREV =3D "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116854): https://lists.openembedded.org/g/openembedde=
d-devel/message/116854
> Mute This Topic: https://lists.openembedded.org/mt/112243212/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

