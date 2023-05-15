Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EB5C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 05:14:30 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.81819.1684127663129078417
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 22:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D2FNfD64;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ab1942ea59so4617481a34.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 22:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684127662; x=1686719662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vD3huchpXdIbYe+W+n6gtanwV7ftKUSGFZTK6qnsico=;
        b=D2FNfD6469a+wutSoznR4AdKIanSm8SlrxwUSn4h99XnPqY0x9xsPqR1dWwa/5eJ4v
         R0vHuw2VhDw+WHuLfzyxMDHNG6lhLV2uzahn8wtLwrD1rsOvjQLngNMe9I4mRBENPYzC
         Rl/G7CrV5I/kYa0r438f+jMDiIN1Wjic66fZ2BuD3WmNongJ+qv11L7R+57JXEeaTTz8
         z/saMKzv80Xr10EdGFXjWI7ZpJsUi4/qduyiZkteJn34XEMi9qK933s/OhoptOksDCHB
         EJMiXLxpmzpBPrV/07oX3+idxqewzXhMVZD1lN8X6M2dcYChxQvCw9/+YG+kX02mfr7I
         3pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684127662; x=1686719662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vD3huchpXdIbYe+W+n6gtanwV7ftKUSGFZTK6qnsico=;
        b=DtOozV9pL69zCPkv5eI3JyXmr9QzL2S9Zc74ZTlIMmMD+gBClcIJYZX9khYX1m8UpZ
         GUunpSorvsiXZjD34HP0NsPaBN0XF44M9lj417c67huADeQgMfbn1TwwyqP7ptArNbd7
         bvbnjFlhPdcBbe/XLBB+t6RkcJYgJ3VE/UaKMgi15tR6c/KMUwqEqTMKRBx50XX6GqyJ
         v2x8qa5U8P6KRQYvV7TBzZmg/uK6sS1dE9okudiuF6lwAtLGkIUNzGwebwEqZxUbPENz
         TRFP6rUSYrjK7usrxjZKaLqS23DzzD72C89W1S0nsy7LwzOHxLNPCJ6X1PcV6owigYzK
         HjVQ==
X-Gm-Message-State: AC+VfDxDXP57o4TeON6LXfo77H93p91lO0nIqjVCOrOjvFseVwLYpgfH
	z2FGBmQVYGFmyL/8ahsXo8V5XaxsAmRTsaF6aZQ=
X-Google-Smtp-Source: ACHHUZ50rw1jWtXpMgd90QAVgDZ1cbeJkBxr0TTzFJiujZZPPfLAT4wQDRpNoxJSW1IvrrWx8w06cnKFO11eKPuterk=
X-Received: by 2002:a05:6870:4294:b0:187:a330:81a2 with SMTP id
 y20-20020a056870429400b00187a33081a2mr16503341oah.54.1684127662050; Sun, 14
 May 2023 22:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com> <1684069442-12244-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1684069442-12244-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 May 2023 22:13:56 -0700
Message-ID: <CAMKF1sodK_ZGVmHGb0Xrs+-TKUAHK3ZtZcBb+q1zakqiVfFzAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 9.1.0 -> 10.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 05:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102593

Please fix spdlog as well to work with fmt version 10.

see - https://errors.yoctoproject.org/Errors/Details/704169/

On Sun, May 14, 2023 at 6:04=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>  Add " and {fmt} contributors" to Copyright
>
> Changelog:
>  https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/fmt/{fmt_9.1.0.bb =3D> fmt_10.0.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/fmt/{fmt_9.1.0.bb =3D> fmt_10.0.0.bb} (77=
%)
>
> diff --git a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb b/meta-oe/recipes-s=
upport/fmt/fmt_10.0.0.bb
> similarity index 77%
> rename from meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> rename to meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> index 34896153c2..a8e6e563da 100644
> --- a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
> @@ -2,10 +2,10 @@ SUMMARY =3D "open-source formatting library for C++"
>  DESCRIPTION =3D "{fmt} is an open-source formatting library for C++. It =
can be used as a safe and fast alternative to (s)printf and iostreams."
>  HOMEPAGE =3D "https://fmt.dev"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Daf88d758f75f3c5c48a967501=
f24384b"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Db9257785fc4f3803a4b71b76c=
1412729"
>
>  SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dhttp=
s"
> -SRCREV =3D "a33701196adfad74917046096bf5a2aa0ab0bb50"
> +SRCREV =3D "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102569): https://lists.openembedded.org/g/openembedde=
d-devel/message/102569
> Mute This Topic: https://lists.openembedded.org/mt/98883938/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

