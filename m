Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88544C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 15:45:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.8514.1650987946811179545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 08:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AsbbWOHU;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id bx5so9147215pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9JQW8PAMyixOI6AO/ZKrN6AgT/8iKJrBpEKrZWZ7IZY=;
        b=AsbbWOHUU9kqNqhuDWDeXrOyFNehQt0Hjn+hwCQ4qiU59ZcNK4lCfx2g6F6i5d0vYk
         sstpNrrEWE/M6XGcMgZZlNxj4PzPBk2fRl0lfiqVvs6wLsByv1PJfHNTMWpNQ4m+xqY8
         zjXnGuU1rmE1Ez8ImTlX+ZVP/tQjfc2/Zp/YbMbwnskmqIFwotz1jtO0W+jVa197nzKq
         VvVGhpIhxr2qivciMI+n4M5AlChNCJP2fXaWt6KiThZvWykiY1CU7d6AkVm5mhJ533LY
         9kI4vOngNcvSekvDxukMAPCXI2igt7C/ZLQgurAyopCoQMcFBhrrJ2l+1Pw725ww14V0
         0K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9JQW8PAMyixOI6AO/ZKrN6AgT/8iKJrBpEKrZWZ7IZY=;
        b=yj9ZNNaPz7kjrtfoDz5h0YGByy96pKTwp2heNoXw/yv1g1h4W04nl7B6WbvcBVfgiE
         cLYFByr4FYtQeuRMZeCCehTV8KujJlMLbRDHcneTWb1EXvzZd/gULVDJNWhYluPTCzWu
         InKnA9L6ZJzhofW6YZwfV3WPRezA0e+GhAGN6Q7/r8PsMZvzKvKLBFN0sivzsiUzKmaa
         I/USY7eXD9ImV9wv8O3oCXx8XpJ+jxq9h2XvypUwxYlxxrJ7+KK0viW4pn3puMip4H2F
         WNQioAYgwMjdHR93FNp+l/MqD+qlAScduPCOr3pfztrpzCt0loUYhAcWkjzHF4EYbEkj
         EzQQ==
X-Gm-Message-State: AOAM5313Zxwdu/UuGrY7JaVsg5suVkQ1UGt7JreIGBv1r4R4JwirVz5B
	WVnCklwm5aKGMeI5VNtKh0kmefeeQTDPJgCN0zQ=
X-Google-Smtp-Source: 
 ABdhPJwKTWin3Mzh/McLLZehwnuPhN1/2HI/nDpenxbHnDWRmyYFQDsxfTiX0UWkdP5M0dC6C8wKUlsUHpl9LwQ1pdg=
X-Received: by 2002:a17:90b:314a:b0:1d9:5ccf:baab with SMTP id
 ip10-20020a17090b314a00b001d95ccfbaabmr15140533pjb.110.1650987946314; Tue, 26
 Apr 2022 08:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220426151236.2924998-1-raj.khem@gmail.com>
In-Reply-To: <20220426151236.2924998-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 26 Apr 2022 17:45:35 +0200
Message-ID: 
 <CALbNGRTabnNuk5UKpAB__zPx=ewq4s-Jc-4Y=3PSJ2K=dD+WYg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] atkmm: Allow build with wayland
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 15:45:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96805

On Tue, Apr 26, 2022 at 5:12 PM Khem Raj <raj.khem@gmail.com> wrote:

Thanks. Just a minor nit: Could you change commit message to 'atkmm:
Allow build with wayland only' because it builds fine with wayland &
x11

Andreas
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb | 2 +-
>  meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb b/meta-oe/rec=
ipes-gnome/atk/atkmm-2.36_2.36.1.bb
> index 9a5b1a1b83..0342b8a9f8 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb
> @@ -12,7 +12,7 @@ GNOMEBN =3D "atkmm"
>
>  inherit gnomebase features_check
>
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  SRC_URI[archive.sha256sum] =3D "e11324bfed1b6e330a02db25cecc145dca03fb0d=
ff47f0710c85e317687da458"
>
> diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-=
gnome/atk/atkmm_2.28.2.bb
> index 1f9c28e530..f6cb0a1e15 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> @@ -11,7 +11,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
>
>  inherit gnomebase features_check
>
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  SRC_URI[archive.sha256sum] =3D "a0bb49765ceccc293ab2c6735ba100431807d384=
ffa14c2ebd30e07993fd2fa4"
>
> --
> 2.36.0
>

