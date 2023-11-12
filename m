Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3060C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 23:04:14 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.25531.1699830248622874330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 15:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WXbrTqWA;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b2ec9a79bdso2709362b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 15:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699830248; x=1700435048; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6Y5LJBeBIOVuGSPXzh1tdJg8DPmu98HS7pI2+Y1jRo=;
        b=WXbrTqWA1oYsQVcCHYXZjWIr2hnaV8SwKYlf0hgQoiciZGIXyburXVsIU3cJSOC/bg
         aNQBP9cBDAKReqsq05PWh/PA7YAVcwXpZJ9FIAnyXmFKv2QntpsyAgz3cIRGhy/1tXUf
         Fq2tvhclKY/kQNby7lYZVT1kLEjbg6Fc30++J9cGOj/ZYeMaoHM11rE5BXTLBuKHk84Y
         MtfCAsIuID9TsEc5FFdKLY4TOf8KHDB6tSp+Rch++SH3fAzwgckxDxszvXfM6ajBr+KL
         ebUJKCh8UpANma1Fy2umNQFf7vE9PCZzSkDbbNwX/R6xSwOHzOLNsWdxQJeDWljZ1Cj7
         o+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699830248; x=1700435048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6Y5LJBeBIOVuGSPXzh1tdJg8DPmu98HS7pI2+Y1jRo=;
        b=lb2wGbLML2sSPyv+HlUzc8RhoqDZY8OlBKrzmPKaygZBKDbscFXBDqx06IMWog2yt5
         cm/6uaS/PeisPFCI56rqSawamLBBT6I5xevx+VQ4a6v3p78eZPSm1v2SYZOISdM2acPS
         h9mT951NC1XO4fWqHCj/IYACRBltnCMeuWaLLFKeGwGC+Bz3qLLJeuA0xLbTyT0db/1B
         LkNgeX8rzKPE3I4iKRE1yBLHYg3CTjfYGsAC+hO/qc78rGknPB0sfUBZfEeQl1TvHq1z
         JCRhYcD2No/rH7r2SZv2ADucicpmHhG6ugLSlNKxY+Gpwmv5x2dycXZDtoTbrQqOlWSJ
         TZnA==
X-Gm-Message-State: AOJu0Yze4BahoA9DAqs2Lnv/BrJt34eiHl4cIHebrYVGUoskdeOMdqUK
	V98yB84T6TZk8msRHGo+ferFfvpzxAbv7pIjdSR6gZwt6KQ=
X-Google-Smtp-Source: AGHT+IFv1bHcmrwgr59Z/euZB9r3+f+9p5lr8g1Br18Y4YCB8vbb9yVi9C/FstrpAkDMmj8G9bEfkhel4tW8zYfPRos=
X-Received: by 2002:a05:6871:4594:b0:1f4:d347:df08 with SMTP id
 nl20-20020a056871459400b001f4d347df08mr7124532oab.17.1699830247872; Sun, 12
 Nov 2023 15:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20231112095452.118629-1-alperyasinak1@gmail.com>
In-Reply-To: <20231112095452.118629-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 15:03:41 -0800
Message-ID: <CAMKF1sr2haogfTq79zEybr6ZU4OE22CWvxKz3Gcptgk74_KHnQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] fuse-exfat: upgrade 1.3.0 -> 1.4.0
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106615

On Sun, Nov 12, 2023 at 1:55=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> Changelog:
>
> * Added exfatattrib utility which prints or changes file attributes [Will
> Thompson].
> * Added FUSE 3 support. FUSE 2 continues to be supported.
> * Added support for timezone offsets [Nathan Hunsperger].
> * Fixed device opening error being reported as FS error.
> * Fixed possible data leakage when uninitialized clusters were allocated =
using
> NtSetInformationFile() call under Windows and FS was not unmounted correc=
tly.
> * Improved compatibility with autoconf 2.70.
> * Fixed disk size reading on NetBSD [Dave Vasilevsky].
> * Fixed "automounted" option handling on FreeBSD [Iouri V. Ivliev].
> * Allowed to specify the "nonempty" mount option.
> * Fixed file data contiguity handling bug which could cause performance
> degradation [noctis].
> * Fixed possible crashes on invalid UTF-8 sequences.
> * Fixed a situation when FS could be erroneously marked as dirty (not cle=
anly
> unmounted).
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../fuse-exfat/{fuse-exfat_1.3.0.bb =3D> fuse-exfat_1.4.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.3.0=
.bb =3D> fuse-exfat_1.4.0.bb} (83%)
>
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1=
.3.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.=
bb
> similarity index 83%
> rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.=
3.0.bb
> rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.=
0.bb
> index ac18fe90f..2f5b1a333 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
> @@ -16,7 +16,7 @@ RRECOMMENDS:${PN} =3D "util-linux-mount"
>
>  inherit autotools pkgconfig
>
> -SRC_URI[md5sum] =3D "846b8c36bfa4684719f9e08e9d3a6bff"
> -SRC_URI[sha256sum] =3D "07652136064da5e4d32df5555f88c138ffa4835a23b88a5b=
ae2015f21006e0d3"
> +SRC_URI[md5sum] =3D "765bf2484d48e5c253d0d8cb8de4f8c0"

We do not need md5sum anymore. So please drop it.

> +SRC_URI[sha256sum] =3D "a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20=
b2c8bbe6edb3001e"
>
>  EXTRA_OECONF +=3D "sbindir=3D${base_sbindir}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106582): https://lists.openembedded.org/g/openembedde=
d-devel/message/106582
> Mute This Topic: https://lists.openembedded.org/mt/102540061/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

