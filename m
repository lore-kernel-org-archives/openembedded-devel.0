Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51DCC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:08:56 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.87639.1723219734777458696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHdfk8qn;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5c661e75ff6so1394562eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723219734; x=1723824534; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGZbXxRw7hVHhe2HilcJRZuPRxp+c+grcgyB36dxIh4=;
        b=AHdfk8qn7UuchwUz9aMnjjKJLNqxTZS9W2mLSUUQk819xn+r9PKxVPk+yCx0WzLmbd
         W+jWycpz5lDnIrZIzPaZq+5PpgMomUPYA28cBPRMoToGYEG7D3IpzhaGqvR2cJCbsfZP
         hTHdsOBF2YSGbdQ7kIwqvYzSRLL1kqPZd2mt6UeedQI2+/Tj3pKcKbDtU5Amtao03xgN
         E9utjvAkKTDENS+FvtSOuy9KWaCQa6CIameLHpja2QGL/B1MFHZYvTA9lF9wBRCKZSfF
         a7FZZ1zWXVctrGocQepNbUHYaVQO0A+b9wZPTGQwooksvWYRV6dtuB44lA5EEKy5/VTZ
         8RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723219734; x=1723824534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGZbXxRw7hVHhe2HilcJRZuPRxp+c+grcgyB36dxIh4=;
        b=lGg4ZMKfm9Dyc+66boET1y42uES1RiK9cwUb/uu7xJTf/oF1GR/J9OUIG0GIcPmG/z
         FKD4XoeEYWmGrQLKeXyrvnW5WgtCweO7R6GyGxtgunRZSYd/yaWQGA8wMnBP1/COzKGZ
         JziVW8tLC1gvW1I8slAmMf6lWYY0mDgbxv9n2RZWc8lpwiXsurbVu7gGGN6LGYhIXodT
         cS742npWDMlPQ8tRs4UTnx4hCqlKbKv06v2s0MzJpWiOTwMAKs1K/5A0F0ytNcySzNJA
         nUIqPddoXO6IIVMe39UEllvVp9Ar9Ep/nuaTVjxfwkDw6mMusF5mpMI5AZ6D0nQzSR6b
         wneA==
X-Gm-Message-State: AOJu0YwVcfw595FDWnk5IZKYdo/M2wIPV6/iejoPG1NY3KQoWOVYDSLe
	zS7FevKU9ZvlBgca7MMewSUI8rbVOkgdKRjVzFlrNVKMCqOi6iG9Bm4oW99KbKGpNTjPdPAu2bU
	1KHgo3DVYHsiw00P7N/vCY0bU3zaWcoY/vV8=
X-Google-Smtp-Source: AGHT+IGAUDDkhn3aAiz3DTR+xprnqGdnzyIiKwhHstj3oEGf+zq8jOFcrM7kw6GIlVJJM5AxAqkSim/yczHtsvJ00V0=
X-Received: by 2002:a05:6820:1b82:b0:5d8:e69:846f with SMTP id
 006d021491bc7-5d87df14155mr2222031eaf.8.1723219733981; Fri, 09 Aug 2024
 09:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124748.126211-1-alperyasinak1@gmail.com>
In-Reply-To: <20240807124748.126211-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2024 09:08:28 -0700
Message-ID: <CAMKF1srJ1+TVbifjSi7_WRadAkTdanAqWqXXN_NvUtPRVgzG1Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-daemon: switch to PEP-517 build backend
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111711

it fails to compile see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4025/step=
s/15/logs/stdio

On Wed, Aug 7, 2024 at 5:47=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> The project has a proper pyproject.toml which declares the setuptools.bui=
ld.meta PEP-517 backend.
>
> Fix:
>
> WARNING: python3-daemon-3.0.1-r0 do_check_backend: QA Issue: inherits set=
uptools3 but has pyproject.toml with setuptools.build_meta, use the correct=
 class [pep517-backend]
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../python/python3-daemon_3.0.1.bb             | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb =
b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> index 715d3bf12..4cdbff0ee 100644
> --- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> @@ -1,18 +1,18 @@
>  DESCRIPTION =3D "Library to implement a well-behaved Unix daemon process=
"
>  HOMEPAGE =3D "https://pagure.io/python-daemon/"
>  SECTION =3D "devel/python"
> -
> -DEPENDS +=3D "python3-docutils-native"
> -RDEPENDS:${PN} =3D "python3-docutils \
> -                  python3-lockfile (>=3D 0.10) \
> -                  python3-resource \
> -"
> -
>  LICENSE =3D "Apache-2.0 & GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://README;md5=3Da3a94c615dc969a70525f1eebbacf2=
35"
>
> -inherit pypi setuptools3
> +PYPI_PACKAGE =3D "python-daemon"
> +
> +inherit pypi python_setuptools_build_meta
>
>  SRC_URI[sha256sum] =3D "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef=
49131e6464b4dae5"
>
> -PYPI_PACKAGE =3D "python-daemon"
> +DEPENDS +=3D "python3-docutils-native"
> +
> +RDEPENDS:${PN} =3D "python3-docutils \
> +                  python3-lockfile (>=3D 0.10) \
> +                  python3-resource \
> +"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111629): https://lists.openembedded.org/g/openembedde=
d-devel/message/111629
> Mute This Topic: https://lists.openembedded.org/mt/107768088/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

